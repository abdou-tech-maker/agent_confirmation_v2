// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/blocs/search_bloc.dart';
import '../../bloc/events/user_event.dart';
import '../../constantes/constantes.dart';
import '../../models/search_model.dart';
import '../../states/result_state.dart';
import 'package:agent_confirmation/pages/call/call.dart' as call;

class CustomSearchDelegate extends SearchDelegate<SearchModel> {
  final SearchBloc searchBloc;

  CustomSearchDelegate(this.searchBloc);

  @override
  String get searchFieldLabel => 'Search customer info for quick access';
  @override
  TextInputType get keyboardType => TextInputType.phone;

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.roboto(
          fontSize: 16,
          color: liteTxt,
        ), //

        border: InputBorder.none,

        contentPadding: const EdgeInsets.symmetric(vertical: 0),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        color: blackText,
        onPressed: () {
          if (query.isEmpty) {
            close(context, SearchModel());
          } else {
            query = '';
          }
        },
        icon: const Icon(
          Icons.clear,
          textDirection: TextDirection.ltr,
          size: 32,
        ),
      ),
    ];
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: IconButton(
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          color: blackText,
          onPressed: () {
            close(context, SearchModel());
          },
          icon: const Icon(
            Icons.arrow_back,
            textDirection: TextDirection.ltr,
            size: 32,
          ),
        ),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty &&
        query.length >= 4 &&
        RegExp(r'^\d+$').hasMatch(query)) {
      try {
        searchBloc.add(Search(int.parse(query)));
        // ignore: empty_catches
      } catch (e) {}
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showErrorSnackBar(
            context, 'Please enter a valid phone Number or parts of it .');
      });
    }

    return BlocBuilder<SearchBloc, ResultState<SearchModel>>(
      bloc: searchBloc,
      builder: (context, state) {
        return state.when(
          idle: () {
            return const SizedBox();
          },
          loading: () {
            return Container(
                color: backGround,
                child: const Center(child: CircularProgressIndicator()));
          },
          data: (searchResult) {
            if (searchResult!.results!.isEmpty) {
              return Container(
                  color: backGround,
                  child: Center(
                      child: Text(
                    'There is No Order Related to this Number ',
                    style: GoogleFonts.poppins(color: greyTxt, fontSize: 14),
                  )));
            } else {
              return Container(
                color: backGround,
                child: ListView.builder(
                  itemCount: searchResult.results?.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 8),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  maintainState: false,
                                  builder: (context) => call.Call(
                                    call: searchResult.results![index]!,
                                  ),
                                ),
                                (route) => false,
                              );
                            },
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                trailing: Container(
                                  decoration: BoxDecoration(
                                    color: getColorForOption(
                                      getStatusName(searchResult
                                          .results![index]!.status!),
                                    ),
                                    border:
                                        Border.all(color: liteTxt, width: 0.5),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      getStatusName(searchResult
                                          .results![index]!.status!),
                                      style: GoogleFonts.poppins(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    searchResult.results![index]!.details !=
                                                null &&
                                            searchResult.results![index]!
                                                .details!.isNotEmpty
                                        ? Text(searchResult
                                                .results![index]!
                                                .details![0]
                                                .logisticalDescription ??
                                            "")
                                        : Text(
                                            "product Not defined in the order",
                                            style: GoogleFonts.poppins(
                                                fontSize: 14),
                                          ),
                                    Text(
                                        searchResult.results![index]!
                                                .customerName ??
                                            "No Name",
                                        style: GoogleFonts.poppins(
                                            color: greyTxt, fontSize: 14)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    );
                  },
                ),
              );
            }
          },
          error: (error) {
            return Container(
              color: backGround,
              child: const Center(
                child: Text("Error Fetching Data ! ",
                    style: TextStyle(color: hardCanceled)),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: backGround,
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
