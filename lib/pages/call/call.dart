// ignore_for_file: sdk_version_since

import 'dart:developer';

import 'package:agent_confirmation/constantes/constantes.dart';
import 'package:agent_confirmation/helpers/validators.dart';
import 'package:agent_confirmation/pages/call/callFirstPage.dart';
import 'package:agent_confirmation/pages/call/callSecondPage.dart';
import 'package:agent_confirmation/pages/call/searchTest.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../bloc/blocs/produc_bloc.dart';
import '../../helpers/common.dart';
import '../../bloc/blocs/callSession_bloc.dart';
import '../../bloc/blocs/orderStatus_bloc.dart';
import '../../bloc/blocs/search_bloc.dart';
import '../../bloc/blocs/wilaya_bloc.dart';
import '../../models/call_session.dart';
import '../../models/data_model.dart';
import '../../models/search_model.dart';
import '../../models/search_object.dart';
import '../../states/result_state.dart';
import '../../widgets/appHeader.dart';
import '../../bloc/events/user_event.dart';

class Call extends StatefulWidget {
  const Call({super.key, this.call});
  final CallSessionModel? call;
  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  final controller = PageController();
  int currentIndex = 0;
  int? commune;
  int statuscode = 10;
  late CallSessionBloc callSessionBloc;
  final currentIndexNotifier = ValueNotifier<int>(0);
  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  void initState() {
    if (widget.call == null) {
      callSessionBloc = BlocProvider.of<CallSessionBloc>(context)
        ..add(const UserEvent.call());
    }

    BlocProvider.of<WilayaBloc>(context).add(const UserEvent.wilaya());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int? intValue;
    return Scaffold(
      backgroundColor: backGround,
      appBar: const MyHeader(
        title: 'Start a Call',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: greyTxt, width: 0.5),
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextFormField(
                readOnly: true,
                onTap: () {
                  /* final SearchModel? result = await*/ showSearch<
                      SearchModel>(
                    context: context,
                    delegate: CustomSearchDelegate(
                        BlocProvider.of<SearchBloc>(context)),
                  );
                },
                validator: (value) {
                  if (!value!.isValidInt()) {
                    return "Enter a Valid number";
                  } else {}
                  return null;
                },
                onChanged: (text) => {
                  if (text.length > 4)
                    {
                      intValue = int.parse(text),
                      SearchObject.set(intValue).then((value) {
                        BlocProvider.of<SearchBloc>(context)
                            .add(UserEvent.search(intValue!));
                      })
                    }
                },
                autofocus: false,
                style: const TextStyle(color: blackText, fontSize: 18),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 24,
                    color: liteTxt,
                  ),
                  hintText: 'Search customer info for quick access',
                  hintStyle: GoogleFonts.roboto(
                    fontSize: 16,
                    color: liteTxt,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() => currentIndexNotifier.value = index);
              },
              children: [
                BlocBuilder<CallSessionBloc, ResultState<CallSessionModel?>?>(
                  builder: (context, state) {
                    return state!.when(
                      idle: () {
                        return const SizedBox();
                      },
                      loading: () {
                        return loader();
                      },
                      data: (data) {
                        if (widget.call != null) {
                          //   Future<List<ProductModel?>> products =  api.getProducts(widget.call!.store!.id, null);

                          BlocProvider.of<ProductBloc>(context).add(
                              UserEvent.product(widget.call!.store!.id!, null));
                          return CallFirstPage(
                            callSessionData: widget.call,
                          );
                        } else {
                          if (data != null) {
                            BlocProvider.of<ProductBloc>(context)
                                .add(UserEvent.product(data.store!.id, null));
                            return CallFirstPage(
                              callSessionData: data,
                            );
                          } else {
                            return const Center(
                              child: Text("There is no order asssigned to you"),
                            );
                          }
                        }
                      },
                      error: (error) {
                        return const SizedBox();
                      },
                    );
                  },
                ),
                BlocBuilder<CallSessionBloc, ResultState<CallSessionModel?>?>(
                  builder: (context, state) {
                    return state!.when(
                      idle: () {
                        return const SizedBox();
                      },
                      loading: () {
                        return loader();
                      },
                      data: (data) {
                        if (widget.call != null) {
                          return CallSecondPage(
                            callSessionData: widget.call,
                          );
                        } else {
                          if (data != null) {
                            return CallSecondPage(
                              callSessionData: data,
                            );
                          } else {
                            return const Center(
                              child: Text("There is no order asssigned to you"),
                            );
                          }
                        }
                      },
                      error: (error) {
                        return const SizedBox();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: backGround,
            height: 60,
            child: Column(
              children: [
                Center(
                    child: SmoothPageIndicator(
                        controller: controller,
                        count: 2,
                        onDotClicked: (index) => controller.animateToPage(index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease),
                        effect: const ExpandingDotsEffect(
                          dotHeight: 6,
                          dotWidth: 6,
                          spacing: 12,
                          dotColor: Colors.black26,
                          activeDotColor: mainColor,
                        ))),
                Row(
                  children: [
                    Expanded(
                        child: _button(
                            context,
                            currentIndexNotifier.value != 0
                                ? (() => controller.previousPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease))
                                : null,
                            'Previous',
                            mainColor,
                            null,
                            null)),
                    const SizedBox(
                      width: 50,
                    ),
                    BlocConsumer<OrderStatusBloc,
                        ResultState<CallSessionModel?>>(
                      listener: (context, state) {
                        state.when(
                          idle: () {},
                          loading: () {},
                          data: (data) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                contentPadding: const EdgeInsets.all(15),
                                title: const Text('Confirmation'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      "assets/images/congrats.png",
                                      height: 100,
                                      width: 100,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Congratulation ! Order set to ',
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                              color: blackText,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        _statusText(data!.status)
                                      ],
                                    ),
                                  ],
                                ),
                                actions: [
                                  _button(context, () {
                                    Navigator.pop(context);
                                  }, "Next Order".tr(), mainColor, 32, 120)
                                ],
                              ),
                            );
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                maintainState: false,
                                builder: (context) => const Call(),
                              ),
                              (route) => false,
                            );
                          },
                          error: (error) {
                            if (statuscode == 40 && commune == null) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Missing Commune'),
                                  content:
                                      const Text('Be Sure to select a commune'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Error'),
                                  content: const Text(
                                      'An error occurred during Performing The Action'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }

                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                maintainState: false,
                                builder: (context) => const Call(),
                              ),
                              (route) => false,
                            );
                          },
                        );
                      },
                      builder: (context, state) {
                        return state.when(
                          // Handle different states...
                          idle: () => ValueListenableBuilder<Box<DataModel>>(
                            valueListenable:
                                Hive.box<DataModel>('DataModel').listenable(),
                            builder: (context, value, child) {
                              if (value.isEmpty) {
                                return Expanded(
                                  child: _button(context, () {
                                    controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.ease);
                                  }, "Next".tr(), mainColor, null, null),
                                );
                              }
                              final data = value.values.first;
                              return Expanded(
                                child: _button(context, () {
                                  if (currentIndexNotifier.value == 0) {
                                    controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  } else {
                                    log(data.toJson().toString());
                                    // Trigger the event here

                                    if (data.status != 10) {
                                      BlocProvider.of<OrderStatusBloc>(context)
                                          .add(
                                        UserEvent.status(
                                          id: data.orderid,
                                          status: data.status,
                                          cancellationReason:
                                              data.cancellationReason,
                                          callBackReason: data.callBackReason,
                                          postponedDate: data.postponedDate,
                                          commune: data.commune,
                                          totalPrice: data.totalPrice,
                                          customerName: data.customerName,
                                          customerPhone2: data.customerPhone2,
                                          customerAddress: data.customerAddress,
                                          customerPhone: data.customerPhone,
                                          deliveryNote: data.noteToDriver,
                                          details: data.details,
                                        ),
                                      );
                                      commune = data.commune;
                                      statuscode = data.status!;
                                      DataModel.clear();
                                    } else {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        _showErrorSnackBar(context,
                                            'Please Select a Status order other than pending   ');
                                      });
                                    }
                                  }
                                }, "Next".tr(), mainColor, null, null),
                              );
                            },
                          ),
                          loading: () => Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: 40,
                              width: double.infinity,
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3.0,
                                ),
                              ),
                            ),
                          ),
                          data: (data) =>
                              ValueListenableBuilder<Box<DataModel>>(
                            valueListenable:
                                Hive.box<DataModel>('DataModel').listenable(),
                            builder: (context, value, child) {
                              if (value.isEmpty) {
                                return Expanded(
                                  child: _button(context, () {
                                    controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.ease);
                                  }, "Next".tr(), mainColor, null, null),
                                );
                              }
                              final data = value.values.first;
                              return Expanded(
                                child: _button(context, () {
                                  if (currentIndexNotifier.value == 0) {
                                    controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  } else {
                                    // Trigger the event here
                                    if (data.status != 10) {
                                      BlocProvider.of<OrderStatusBloc>(context)
                                          .add(
                                        UserEvent.status(
                                          id: data.orderid,
                                          status: data.status,
                                          cancellationReason:
                                              data.cancellationReason,
                                          callBackReason: data.callBackReason,
                                          postponedDate: data.postponedDate,
                                          commune: data.commune,
                                          totalPrice: data.totalPrice,
                                          customerName: data.customerName,
                                          customerPhone2: data.customerPhone2,
                                          customerAddress: data.customerAddress,
                                          customerPhone: data.customerPhone,
                                          deliveryNote: data.noteToDriver,
                                          details: data.details,
                                        ),
                                      );
                                      commune = data.commune;
                                      statuscode = data.status!;
                                      DataModel.clear();
                                    } else {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        _showErrorSnackBar(context,
                                            'Please Select a Status order other than pending   ');
                                      });
                                    }
                                  }
                                }, "Next".tr(), mainColor, null, null),
                              );
                            },
                          ),
                          error: (error) => buildErrorWidget(),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusText(int? status) {
    return Text(
      getStatusName(status!),
      style: GoogleFonts.poppins(
          color: getColorForOption(getStatusName(status)),
          fontSize: 14,
          fontWeight: FontWeight.bold),
    );
  }

  Widget _button(BuildContext context, void Function()? onPressed, String? text,
      Color? color, double? height, double? width) {
    return ElevatedButton(
        statesController: MaterialStatesController(),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(left: 15, right: 15),
          backgroundColor: color,
          fixedSize: Size(width ?? double.infinity, height ?? 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: onPressed,
        child: Text(
          text!,
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        ));
  }

  Widget buildErrorWidget() {
    return ValueListenableBuilder<Box<DataModel>>(
      valueListenable: Hive.box<DataModel>('DataModel').listenable(),
      builder: (context, value, child) {
        if (value.isEmpty) {
          return Expanded(
            child: _button(context, () {
              controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
            }, "Next".tr(), mainColor, null, null),
          );
        }
        final data = value.values.first;
        return Expanded(
          child: _button(context, () {
            if (currentIndexNotifier.value == 0) {
              controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
            } else {
              if (data.status != 10) {
                BlocProvider.of<OrderStatusBloc>(context).add(
                  UserEvent.status(
                    id: data.orderid,
                    status: data.status,
                    cancellationReason: data.cancellationReason,
                    callBackReason: data.callBackReason,
                    postponedDate: data.postponedDate,
                    commune: data.commune,
                    totalPrice: data.totalPrice,
                    customerName: data.customerName,
                    customerPhone2: data.customerPhone2,
                    customerAddress: data.customerAddress,
                    customerPhone: data.customerPhone,
                    deliveryNote: data.noteToDriver,
                    details: data.details,
                  ),
                );
                commune = data.commune;
                statuscode = data.status!;
                DataModel.clear();
              } else {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _showErrorSnackBar(context,
                      'Please Select a Status order other than pending   ');
                });
              }
            }
          }, "Next".tr(), mainColor, null, null),
        );
      },
    );
  }
}

Color getColorForOption(String option) {
  switch (option) {
    case 'Pending':
      return pending;
    case 'Postponed':
      return postponed;
    case 'Cancel':
      return canceled;
    case 'Confirmed':
      return confirmed;
    case 'CallBack':
      return selectedIcon;
    default:
      return Colors.transparent;
  }
}

String getStatusName(int statusId) {
  switch (statusId) {
    case 10:
      return 'Pending';
    case 20:
      return 'CallBack';
    case 30:
      return "Postponed";
    case 100:
      return 'Cancel';
    case 40:
      return 'Confirmed';

    default:
      return 'Pending';
  }
}

Widget buildDataWidget(BuildContext context, CallSessionModel? data) {
  // Widget to show when the API call is successful and data is available
  return Center(
    child: Text('Data is available: ${data.toString()}'),
  );
}
