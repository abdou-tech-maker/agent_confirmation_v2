// ignore_for_file: file_names


import 'package:agent_confirmation/constantes/constantes.dart';
import 'package:agent_confirmation/helpers/common.dart';
import 'package:agent_confirmation/widgets/appHeader.dart';
import 'package:agent_confirmation/widgets/statsHolder.dart';
import 'package:flutter/material.dart';
import 'package:agent_confirmation/api/api_repository.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:jiffy/jiffy.dart';

import '../models/stats_model.dart';
import '../models/user_model.dart';

class DashBorad extends StatefulWidget {
  const DashBorad({super.key});

  @override
  State<DashBorad> createState() => _DashBoradState();
}

class _DashBoradState extends State<DashBorad> {
  ApiRepository api = ApiRepository();
  Jiffy? endingDate;
  Jiffy? startingDate;
  DateTimeRange rangeDate =
      DateTimeRange(end: DateTime(2050), start: DateTime.now());

  StatsModel? stats = StatsModel();

  Future _showFiltrePicker() async {
    await showDateRangePicker(
            initialEntryMode: DatePickerEntryMode.calendar,
            context: context,
            firstDate: DateTime(2023),
            lastDate: DateTime(2050))
        .then((value) {
      setState(() {
        rangeDate = value!;
        endingDate = Jiffy(rangeDate.end);
        startingDate = Jiffy(rangeDate.start);
      });
    });
  }

  Future<void> _onrefresh() async {
    StatsModel? updatedStats = await api.getStats();

    setState(() {
      stats = updatedStats;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      appBar: const MyHeader(
        title: 'Dashboard',
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: ValueListenableBuilder<Box<UserModel>>(
          valueListenable: Hive.box<UserModel>('UserModel').listenable(),
          builder: (context, value, child) {
            UserModel user = value.values.first;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Text(
                  "Welcome Dear , \n ${user.fullname}",
                  style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: blackText),
                ),
                _body(context),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _body(BuildContext ctx) {
    return FutureBuilder<StatsModel?>(
      future: api.getStats(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          stats = snapshot.data;
          return Expanded(
            child: Center(
              child: RefreshIndicator(
                onRefresh: _onrefresh,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 42,
                    ),
                    StatsHolder(
                      backGroundColor: mainColor,
                      isPercentage: false,
                      accomplished: 8,
                      total: 10,
                      isProgress: true,
                      path: "assets/images/To be confirmed1.png",
                      header: "TO BE CONFIRMED TODAY",
                      maintext: stats?.orderToBeConfirmed.toString() ?? "0",
                      isSubtitle: true,
                      subText: "Orders Left",
                      trailing: Text(
                        "\n10",
                        textAlign: TextAlign.end,
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: _showFiltrePicker,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            padding: const EdgeInsets.only(right: 6, left: 6),
                            width: 150,
                            height: 42,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "${startingDate?.MMMd.toString() ?? "01 Jan"} - ${endingDate?.MMMd.toString() ?? "31 Dec"} ",
                                  style: GoogleFonts.poppins(
                                      color: blackText, fontSize: 13),
                                ),
                                Image.asset(
                                  "assets/images/Calendar.png",
                                  color: Colors.black,
                                  height: 18,
                                  width: 18,
                                )
                              ],
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    StatsHolder(
                      backGroundColor: confirmed,

                      isProgress: false,
                      path: "assets/images/Check.png",
                      header: "Confirmed Orders",
                      headerFont: 16,
                      headColor: greyTxt,
                      maintext: stats?.ordersConfirmed.toString() ?? "0",
                      // trailing: Text("+25%"),
                      isPercentage: true,
                      percentage: "+25%",
                      percentageColor: Colors.green,
                      isSubtitle: true,
                      subText: "Orders ",
                      height: 80,
                      percentageIcon: Icons.arrow_upward,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: StatsHolder(
                            backGroundColor: hardCanceled,
                            isProgress: false,
                            isSubtitle: false,
                            path: "assets/images/Delete.png",
                            header: "CANCELLED ORDERS",
                            maintext: stats?.ordersCancelled.toString() ?? "0",
                            headColor: greyTxt,
                            isPercentage: true,
                            percentageIcon: Icons.arrow_upward,
                            percentageColor: const Color(0xFF16A34A),
                            percentage: "+12%",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          flex: 1,
                          child: StatsHolder(
                            backGroundColor: callBackColor,
                            isProgress: false,
                            isSubtitle: false,
                            headColor: greyTxt,
                            path: "assets/images/CallBack.png",
                            header: "Call Back Orders",
                            maintext: stats?.ordersCallback.toString() ?? '0',
                            isPercentage: true,
                            percentageIcon: Icons.arrow_upward,
                            percentageColor: const Color(0xFF16A34A),
                            percentage: "+12%",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: StatsHolder(
                            backGroundColor: hardPending,
                            isProgress: false,
                            path: "assets/images/Unfullfilled orders.png",
                            header: "PENDING ORDERS",
                            headColor: greyTxt,
                            maintext: stats?.pendingOrders.toString() ?? "0",
                            isSubtitle: false,
                            subColor: greyTxt,
                            isPercentage: true,
                            percentage: "-12%",
                            percentageIcon: Icons.arrow_downward,
                            percentageColor: const Color(0XFFEB5757),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          flex: 1,
                          child: StatsHolder(
                            backGroundColor: postponed,
                            isProgress: false,
                            path: "assets/images/Postponed.png",
                            header: "POSTPONED ORDERS",
                            headColor: greyTxt,
                            maintext: stats?.ordersPostponed.toString() ?? "0",
                            isSubtitle: false,
                            subColor: greyTxt,
                            isPercentage: true,
                            percentageIcon: Icons.arrow_upward,
                            percentageColor: const Color(0xFF16A34A),
                            percentage: "+12%",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    /* StatsHolder(
                      isProgress: false,
                      path: "assets/images/CallBack.png",
                      header: "CALL BACK OF THE DAY",
                      headColor: greyTxt,
                      maintext: /*stats?.orderToBeConfirmed.toString() ?? "0"*/
                          "Lylia Slamani",
                      trailing: _callAction(),
                      isSubtitle: false,
                      isPercentage: false,
                    ),*/
                  ],
                ),
              ),
            ),
          );
        }
        return Center(
          child: loader(),
        );
      },
    );
  }

  
}
