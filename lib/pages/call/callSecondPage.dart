// ignore_for_file: file_names
import 'dart:developer';

import 'package:agent_confirmation/bloc/blocs/wilaya_bloc.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jiffy/jiffy.dart';

import 'package:agent_confirmation/bloc/blocs/communes_bloc.dart';
import 'package:agent_confirmation/models/abortReasons_model.dart';
import 'package:agent_confirmation/models/callBackReason_model.dart';
import 'package:agent_confirmation/helpers/dateWidget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:agent_confirmation/api/api_repository.dart';
import 'package:agent_confirmation/models/call_session.dart';
import 'package:agent_confirmation/models/commune_model.dart';
import 'package:agent_confirmation/models/wilaya_model.dart';

import 'package:agent_confirmation/constantes/constantes.dart';

import '../../helpers/common.dart';
import '../../bloc/events/user_event.dart';
import '../../models/data_model.dart';
import '../../states/result_state.dart';

class CallSecondPage extends StatefulWidget {
  const CallSecondPage({super.key, required this.callSessionData});

  final CallSessionModel? callSessionData;

  @override
  State<CallSecondPage> createState() => _CallSecondPageState();
}

class _CallSecondPageState extends State<CallSecondPage> {
  late TextEditingController wilayaCrtl;
  late TextEditingController communeCrtl;

  ValueNotifier<WilayaModel?> wilayaSelectedNotifier =
      ValueNotifier<WilayaModel?>(null);
  ValueNotifier<CommuneModel?> communeSelectedNotifier =
      ValueNotifier<CommuneModel?>(null);
  late ValueNotifier<String> selectedStatusNotifier;
  int selectedIndex = 0;
  TextEditingController? productName;
  late TextEditingController totalPriceController;
  late TextEditingController note;
  ScrollController scroll = ScrollController();
  late TextEditingController customerAddressController;

  late String selectedOption;
  ApiRepository api = ApiRepository();
  WilayaModel? wilayaSelected;
  CommuneModel? communeSelected;
  int? abortReason;
  int? callBackReason;
  String? postponedToDate;
  int? selectedStatus;
  Jiffy? selectedDate;

  @override
  void initState() {
    super.initState();
    wilayaCrtl = TextEditingController();
    communeCrtl = TextEditingController();
    DataModel.updateDataModel(orderId: widget.callSessionData!.id);
    customerAddressController =
        TextEditingController(text: widget.callSessionData!.customerAddress);
    selectedStatusNotifier =
        ValueNotifier(getStatusName(widget.callSessionData!.status!));
    selectedOption = getStatusName(widget.callSessionData!.status!);
    note = TextEditingController(text: widget.callSessionData!.noteToDriver);

    totalPriceController = TextEditingController(
        text: widget.callSessionData!.totalPrice!.toString());
  }

  @override
  void dispose() {
    customerAddressController.dispose();
    wilayaCrtl.dispose();
    communeCrtl.dispose();
    note.dispose();
    totalPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backGround,
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(double.infinity, 32),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(width: 1, color: blackText)),
                      backgroundColor:
                          selectedIndex == 0 ? mainColor : backGround,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Text(
                      'Home Delivery',
                      style: GoogleFonts.poppins(
                        color: selectedIndex == 0 ? Colors.white : blackText,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(double.infinity, 32),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: blackText),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor:
                          selectedIndex == 1 ? mainColor : backGround,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Text(
                      'Stop-desk',
                      style: GoogleFonts.poppins(
                        color: selectedIndex == 1 ? Colors.white : blackText,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (selectedIndex == 0) _homeDelivery(context),
            if (selectedIndex == 1) _stopDesk()
          ])),
    );
  }

  Widget _homeDelivery(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _editableContainer(
              87,
              "Customer Address",
              false,
              null,
              true,
              widget.callSessionData!.customerAddress ?? "Not Mentioned",
              customerAddressController,
              false, (text) {
            log(customerAddressController.text);
            DataModel.updateDataModel(customerAddress: text);
          }),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              flex: 1,
              child: BlocBuilder<WilayaBloc, ResultState<List<WilayaModel>>>(
                builder: (context, state) {
                  return state.when(
                    idle: () {
                      return const SizedBox();
                    },
                    loading: () {
                      return loader();
                    },
                    data: (data) {
                      List<WilayaModel> wilayas = data!;

                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: DropdownSearch<WilayaModel>(
                            mode: Mode.DIALOG,
                            items: wilayas,
                            dropdownSearchDecoration: InputDecoration(
                              hintText: 'City',
                              hintStyle: GoogleFonts.roboto(
                                  fontSize: 16, color: liteTxt),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                            ),
                            onChanged: (WilayaModel? selectedWilaya) {
                              wilayaSelectedNotifier.value = selectedWilaya;
                              BlocProvider.of<CommuneBloc>(context).add(
                                  UserEvent.commune(
                                      wilayaSelectedNotifier.value!.id!));
                              wilayaCrtl.clear();
                            },
                            showSearchBox: true,
                            showClearButton: false,
                            searchFieldProps: TextFieldProps(
                              controller: wilayaCrtl,
                              decoration: InputDecoration(
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 14, color: liteTxt),
                                hintText: 'Search .. ',
                                prefixIcon: const Icon(Icons.search),
                              ),
                            ),
                            itemAsString: (WilayaModel? wilaya) =>
                                wilaya?.name ?? '',
                            dropdownBuilder: (
                              BuildContext context,
                              WilayaModel? item,
                            ) {
                              if (item?.name != null) {
                                return Text(
                                  item!.name!,
                                  style: GoogleFonts.poppins(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                );
                              } else {
                                return Text(
                                  'City',
                                  style: GoogleFonts.roboto(
                                      fontSize: 16, color: liteTxt),
                                );
                              }
                            }),
                      );
                    },
                    error: (error) {
                      return const Center(child: Text('Server error'));
                    },
                  );
                },
              ),
              // ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 0.1)),
                height: 60,
                width: double.infinity,
                child:
                    BlocBuilder<CommuneBloc, ResultState<List<CommuneModel>>>(
                  builder: (context, state) {
                    return state.when(
                      idle: () {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "  Commune",
                              style: GoogleFonts.roboto(
                                  fontSize: 16, color: liteTxt),
                            ),
                            const Icon(Icons.arrow_drop_down)
                          ],
                        );
                      },
                      loading: () {
                        return loader();
                      },
                      data: (data) {
                        List<CommuneModel> communes = data!;

                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: DropdownSearch<CommuneModel>(
                              mode: Mode.DIALOG,
                              items: communes,
                              dropdownSearchDecoration: InputDecoration(
                                hintText: '  Commune',
                                hintStyle: GoogleFonts.roboto(
                                    fontSize: 16, color: liteTxt),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                              ),
                              onChanged: (CommuneModel? selectedCommune) {
                                communeSelectedNotifier.value = selectedCommune;
                                DataModel.updateDataModel(
                                    commune: communeSelectedNotifier.value!.id);
                                communeCrtl.clear(); // Clear the controller
                              },
                              showSearchBox: true,
                              showClearButton: false,
                              searchFieldProps: TextFieldProps(
                                controller: communeCrtl,
                                decoration: InputDecoration(
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 14, color: liteTxt),
                                  hintText: 'Search .. ',
                                  prefixIcon: const Icon(Icons.search),
                                ),
                              ),
                              itemAsString: (CommuneModel? commune) =>
                                  commune?.name ?? '',
                              dropdownBuilder: (
                                BuildContext context,
                                CommuneModel? item,
                              ) {
                                if (item?.name != null) {
                                  return Text(
                                    item!.name!,
                                    style: GoogleFonts.poppins(fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                  );
                                } else {
                                  return Text(
                                    'Commune',
                                    style: GoogleFonts.roboto(
                                        fontSize: 16, color: liteTxt),
                                  );
                                }
                              }),
                        );
                      },
                      error: (error) {
                        return const Center(child: Text('Server error'));
                      },
                    );
                  },
                ),
              ),
            )
          ]),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: _editableContainer(60, " Delivery Price", false, null,
                      false, "", null, true, (text) {})),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: _editableContainer(60, " Total Price", false, null,
                      true, "", totalPriceController, true, (text) {
                if (text.isNotEmpty) {
                  int parsedValue = int.tryParse(text) ?? 0;

                  DataModel.updateDataModel(totalPrice: parsedValue);
                } else {
                  DataModel.updateDataModel(totalPrice: 0);
                }
              })),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          _editableContainer(
              65, "Note to Delivery", false, null, true, "", note, false,
              (text) {
            log(note.text);
            DataModel.updateDataModel(noteToDriver: text);
          }),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: getColorForOption(selectedStatusNotifier.value),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: DropdownButton<String>(
              isExpanded: true,
              iconSize: 30,
              value: selectedOption,
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue!;
                });
                selectedStatusNotifier.value = newValue!;
                selectedStatus = getStatusId(selectedStatusNotifier.value);
                DataModel.updateDataModel(status: selectedStatus);
              },
              icon: const Icon(Icons.keyboard_arrow_down,
                  color: Colors.white, size: 25),
              dropdownColor: backGround,
              style: GoogleFonts.poppins(color: Colors.black),
              underline: Container(),
              items: [
                DropdownMenuItem<String>(
                  value: 'Pending',
                  child: Text(
                    'Pending',
                    style: TextStyle(
                      color: selectedOption == 'Pending'
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedOption = 'Pending';
                    });
                    selectedStatusNotifier.value = 'Pending';
                    selectedStatus = getStatusId(selectedStatusNotifier.value);
                  },
                ),
                DropdownMenuItem<String>(
                  value: 'Postponed',
                  child: Text(
                    'Postponed',
                    style: TextStyle(
                      color: selectedOption == 'Postponed'
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedOption = 'Postponed';
                    });
                    selectedStatus = getStatusId(selectedOption);
                  },
                ),
                DropdownMenuItem<String>(
                  value: 'Cancel',
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: selectedOption == 'Cancel'
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedOption = 'Cancel';
                    });

                    selectedStatusNotifier.value = 'Cancel';
                    selectedStatus = getStatusId(selectedOption);
                  },
                ),
                DropdownMenuItem<String>(
                  value: 'CallBack',
                  child: Text(
                    'CallBack',
                    style: TextStyle(
                      color: selectedOption == 'CallBack'
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedOption = 'CallBack';
                    });
                    selectedStatusNotifier.value = 'CallBack';
                    selectedStatus = getStatusId(selectedOption);
                  },
                ),
                DropdownMenuItem<String>(
                  value: 'Confirmed',
                  child: Text(
                    'Confirmed',
                    style: TextStyle(
                      color: selectedOption == 'Confirmed'
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedOption = 'Confirmed';
                    });
                    selectedStatus = getStatusId(selectedOption);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          selectedOption == 'Cancel'
              ? Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 0.5)),
                  height: 56,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  child: FutureBuilder<List<AbortReasonsModel?>>(
                    future: api.getAbortReasons(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(
                            child: Text('Error fetching Cancellation Reasons'));
                      } else {
                        List<AbortReasonsModel?> reasons = snapshot.data!;

                        return DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<AbortReasonsModel?>(
                            hint: Text(
                              "Select a Cancellation Reason",
                              style: GoogleFonts.roboto(
                                  fontSize: 14, color: liteTxt),
                            ),
                            value: null,
                            onChanged: (selectReason) {
                              abortReason = selectReason!.id;
                              DataModel.updateDataModel(
                                  cancellationReason: abortReason);
                            },
                            items: reasons.map((reason) {
                              return DropdownMenuItem<AbortReasonsModel?>(
                                alignment: Alignment.center,
                                value: reason,
                                child: Text(
                                  reason?.name ?? "",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black, fontSize: 14),
                                ),
                              );
                            }).toList(),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        );
                      }
                    },
                  ))
              : const SizedBox.shrink(),
          selectedOption == 'CallBack'
              ? Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 0.5)),
                  height: 56,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  child: FutureBuilder<List<CallBackReasonModel?>>(
                    future: api.getCallBackReasons(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(
                            child: Text('Error fetching CallBack Reasons'));
                      } else {
                        List<CallBackReasonModel?> reasons = snapshot.data!;

                        return DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<CallBackReasonModel?>(
                            hint: Text(
                              "Select a CallBack Reason",
                              style: GoogleFonts.roboto(
                                  fontSize: 14, color: liteTxt),
                            ),
                            value: null,
                            onChanged: (backReason) {
                              callBackReason = backReason!.id;
                              DataModel.updateDataModel(
                                  callBackReason: callBackReason);
                            },
                            items: reasons.map((reason) {
                              return DropdownMenuItem<CallBackReasonModel?>(
                                alignment: Alignment.center,
                                value: reason,
                                child: Text(
                                  reason?.name ?? "",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black, fontSize: 14),
                                ),
                              );
                            }).toList(),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        );
                      }
                    },
                  ))
              : const SizedBox.shrink(),
          selectedOption == 'Postponed'
              ? Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 0.5)),
                  height: 60,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  child: DateWidget(
                    onResult: (date) {
                      selectedDate = date;
                      DateTime parsedDate =
                          DateFormat("dd/MM/yyyy").parse(selectedDate!.yMd);

                      String dateOnlyString =
                          DateFormat("yyyy-MM-dd").format(parsedDate);
                      postponedToDate = dateOnlyString;

                      DataModel.updateDataModel(postponedDate: postponedToDate);
                    },
                  ),
                )
              : const SizedBox.shrink(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _stopDesk() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _editableContainer(
              60,
              "",
              true,
              const Icon(Icons.keyboard_arrow_down, color: liteTxt, size: 30),
              false,
              "Stop Desk",
              null,
              false,
              (text) {}),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  child: _editableContainer(60, "Total Price", false, null,
                      true, "", totalPriceController, true, (text) {
                if (text.isNotEmpty) {
                  int parsedValue = int.tryParse(text) ?? 0;

                  DataModel.updateDataModel(totalPrice: parsedValue);
                } else {
                  DataModel.updateDataModel(totalPrice: 0);
                }
              })),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: _editableContainer(60, " Delivery Price", false, null,
                      false, "", null, true, (text) {})),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          _editableContainer(
              61.34, "Note to Delivery", false, null, true, "", note, false,
              (text) {
            log(text);
            DataModel.updateDataModel(noteToDriver: text);
          }),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: getColorForOption(selectedStatusNotifier.value),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: DropdownButton<String>(
              isExpanded: true,
              iconSize: 30,
              value: selectedOption,
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue!;
                });
                selectedStatusNotifier.value = newValue!;
                selectedStatus = getStatusId(selectedStatusNotifier.value);
                DataModel.updateDataModel(status: selectedStatus);
              },
              icon: const Icon(Icons.keyboard_arrow_down,
                  color: Colors.white, size: 25),
              dropdownColor: backGround,
              style: GoogleFonts.poppins(color: Colors.black),
              underline: Container(),
              items: [
                DropdownMenuItem<String>(
                  value: 'Pending',
                  child: Text(
                    'Pending',
                    style: TextStyle(
                      color: selectedOption == 'Pending'
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedOption = 'Pending';
                    });
                    selectedStatusNotifier.value = 'Pending';
                    selectedStatus = getStatusId(selectedStatusNotifier.value);
                  },
                ),
                DropdownMenuItem<String>(
                  value: 'Postponed',
                  child: Text(
                    'Postponed',
                    style: TextStyle(
                      color: selectedOption == 'Postponed'
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedOption = 'Postponed';
                    });
                    selectedStatus = getStatusId(selectedOption);
                  },
                ),
                DropdownMenuItem<String>(
                  value: 'Cancel',
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: selectedOption == 'Cancel'
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedOption = 'Cancel';
                    });
                    selectedStatusNotifier.value = 'Cancel';
                    selectedStatus = getStatusId(selectedOption);
                  },
                ),
                DropdownMenuItem<String>(
                  value: 'CallBack',
                  child: Text(
                    'CallBack',
                    style: TextStyle(
                      color: selectedOption == 'CallBack'
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedOption = 'CallBack';
                    });
                    selectedStatusNotifier.value = 'CallBack';
                    selectedStatus = getStatusId(selectedOption);
                  },
                ),
                DropdownMenuItem<String>(
                  value: 'Confirmed',
                  child: Text(
                    'Confirmed',
                    style: TextStyle(
                      color: selectedOption == 'Confirmed'
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedOption = 'Confirmed';
                    });
                    selectedStatus = getStatusId(selectedOption);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          selectedOption == 'Cancel'
              ? Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 0.5)),
                  height: 56,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  child: FutureBuilder<List<AbortReasonsModel?>>(
                    future: api.getAbortReasons(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(
                            child: Text('Error fetching Cancellation Reasons'));
                      } else {
                        List<AbortReasonsModel?> reasons = snapshot.data!;

                        return DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<AbortReasonsModel?>(
                            hint: Text(
                              "Select a Cancellation Reason",
                              style: GoogleFonts.roboto(
                                  fontSize: 14, color: liteTxt),
                            ),
                            value: null,
                            onChanged: (selectReason) {
                              abortReason = selectReason!.id;
                            },
                            items: reasons.map((reason) {
                              return DropdownMenuItem<AbortReasonsModel?>(
                                alignment: Alignment.center,
                                value: reason,
                                child: Text(
                                  reason?.name ?? "",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black, fontSize: 14),
                                ),
                              );
                            }).toList(),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        );
                      }
                    },
                  ))
              : const SizedBox.shrink(),
          selectedOption == 'CallBack'
              ? Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 0.5)),
                  height: 56,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  child: FutureBuilder<List<CallBackReasonModel?>>(
                    future: api.getCallBackReasons(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(
                            child: Text('Error fetching CallBack Reasons'));
                      } else {
                        List<CallBackReasonModel?> reasons = snapshot.data!;

                        return DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<CallBackReasonModel?>(
                            hint: Text(
                              "Select a CallBack Reason",
                              style: GoogleFonts.roboto(
                                  fontSize: 14, color: liteTxt),
                            ),
                            value: null,
                            onChanged: (backReason) {
                              callBackReason = backReason!.id;
                            },
                            items: reasons.map((reason) {
                              return DropdownMenuItem<CallBackReasonModel?>(
                                alignment: Alignment.center,
                                value: reason,
                                child: Text(
                                  reason?.name ?? "",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black, fontSize: 14),
                                ),
                              );
                            }).toList(),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        );
                      }
                    },
                  ))
              : const SizedBox.shrink(),
          selectedOption == 'Postponed'
              ? Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 0.5)),
                  height: 60,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  child: DateWidget(
                    onResult: (date) {
                      selectedDate = date;
                      DateTime parsedDate =
                          DateFormat("dd/MM/yyyy").parse(selectedDate!.yMd);

                      String dateOnlyString =
                          DateFormat("yyyy-MM-dd").format(parsedDate);
                      postponedToDate = dateOnlyString;

                      DataModel.updateDataModel(postponedDate: postponedToDate);
                    },
                  ),
                )
              : const SizedBox.shrink(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _editableContainer(
    double? height,
    String? title,
    bool isTrailing,
    Widget? trailing,
    bool enabled,
    String customerName,
    TextEditingController? textEditingController,
    bool isNumber,
    void Function(String)? onChanged,
  ) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: enabled ? greyTxt : liteTxt, width: 0.5),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)),
        height: height ?? 75,
        width: double.infinity,
        child: TextFormField(
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          readOnly: !enabled,
          controller: textEditingController,
          onChanged: onChanged,
          autofocus: false,
          style: GoogleFonts.poppins(color: blackText, fontSize: 16),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: GoogleFonts.roboto(
                fontSize: 16, fontWeight: FontWeight.w500, color: liteTxt),
            labelText: title!,
            border: InputBorder.none,
            suffixIcon: isTrailing ? trailing : null,
            hintStyle: GoogleFonts.roboto(
              fontSize: 16,
              color: liteTxt,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          ),
        ));
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

int getStatusId(String statusName) {
  switch (statusName) {
    case 'Pending':
      return 10;
    case 'CallBack':
      return 20;
    case "Postponed":
      return 30;
    case 'Cancel':
      return 100;
    case 'Confirmed':
      return 40;

    default:
      return 10;
  }
}
