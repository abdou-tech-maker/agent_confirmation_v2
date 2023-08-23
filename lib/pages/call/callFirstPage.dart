// ignore_for_file: file_names, avoid_print

import 'dart:developer';

import 'package:agent_confirmation/constantes/constantes.dart';
import 'package:agent_confirmation/constantes/validators.dart';

import 'package:agent_confirmation/models/call_session.dart';
import 'package:agent_confirmation/models/product_model.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Helpers/common.dart';
import '../../bloc/blocs/produc_bloc.dart';
import '../../helpers/productDetails.dart';
import '../../models/data_model.dart';
import '../../states/result_state.dart';

class CallFirstPage extends StatefulWidget {
  const CallFirstPage({super.key, required this.callSessionData});

  final CallSessionModel? callSessionData;
  @override
  State<CallFirstPage> createState() => _CallFirstPageState();
}

class _CallFirstPageState extends State<CallFirstPage> {
  late TextEditingController phoneController;
  late TextEditingController priceController;
  late TextEditingController customerNameController;
  late TextEditingController productNameController;
  TextEditingController secondProduct = TextEditingController();
  late TextEditingController secondPhone;
  late ValueNotifier<int> productQuantity;
  late ValueNotifier<int> secondProductQuantity;
  late ValueNotifier<bool> isSecondProduct;
  late TextEditingController storeNameController;

  bool isSecondPhone = false;
  GlobalKey<AutoCompleteTextFieldState<ProductModel>> key = GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<ProductModel>> key1 = GlobalKey();

  ScrollController scroll = ScrollController();
  late List<ProductModel> productList;
  @override
  void initState() {
    super.initState();
    storeNameController =
        TextEditingController(text: widget.callSessionData!.store!.name);
    String transformedPhone =
        widget.callSessionData!.customerPhone!.transformAndValidatePhone();
    isSecondProduct = ValueNotifier(false);
    secondProductQuantity = ValueNotifier(0);

    if (widget.callSessionData!.details != null &&
        widget.callSessionData!.details!.isNotEmpty) {
      productList = [];
      productList.add(widget.callSessionData!.details![0]);

      productQuantity =
          ValueNotifier(widget.callSessionData!.details![0].quantity!);
      productNameController = TextEditingController(
        text: widget.callSessionData!.details![0].logisticalDescription,
      );
    } else {
      productList = [];

      productQuantity = ValueNotifier(0);
      productNameController = TextEditingController(text: "");
    }

    priceController = TextEditingController(
        text: widget.callSessionData!.totalPrice.toString());
    if (widget.callSessionData!.customerPhone2 != null) {
      secondPhone =
          TextEditingController(text: widget.callSessionData!.customerPhone2!);
    } else {
      secondPhone = TextEditingController();
    }
    phoneController = TextEditingController(text: transformedPhone);
    customerNameController =
        TextEditingController(text: widget.callSessionData!.customerName!);
  }

  @override
  void dispose() {
    secondPhone.dispose();
    priceController.dispose();
    phoneController.dispose();
    customerNameController.dispose();
    super.dispose();
  }

  void _launchURL({required url}) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalNonBrowserApplication,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(controller: scroll, children: [
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<ProductBloc, ResultState<List<ProductModel>>>(
              builder: (context, state) {
            return state.when(
              idle: () {
                return const SizedBox();
              },
              loading: () {
                return loader();
              },
              data: (data) {
                List<ProductModel> products = data!;

                return ProductDetails(
                  products: products,
                  productName: productNameController,
                  productDescription: productNameController.text,
                  productQuantity: productQuantity.value,
                  onChanged: (item) async {
                    productNameController.text = item!.logisticalDescription!;

                    final selectedProduct = item;
                    selectedProduct.product = item.id;
                    selectedProduct.id = null;
                    selectedProduct.stockLevel = null;
                    productList.clear();
                    productList.add(selectedProduct);
                    DataModel.updateDataModel(details: productList);
                    final data = await DataModel.get();
                    log(data!.details!.length.toString());
                    log('this is data model first element');
                    log(data.details!.elementAt(0).toJson().toString());
                  },
                  decrement: () {
                    setState(() {
                      productQuantity.value = productQuantity.value - 1;
                      productList.first.quantity = productQuantity.value;
                      DataModel.updateDataModel(details: productList);
                      for (ProductModel product in productList) {
                        log(product.toJson().toString());
                      }
                    });
                  },
                  increment: () {
                    setState(() {
                      productQuantity.value = productQuantity.value + 1;
                      productList.first.quantity = productQuantity.value;
                      DataModel.updateDataModel(details: productList);

                      for (ProductModel product in productList) {
                        log(product.toJson().toString());
                      }
                    });
                  },
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          isSecondProduct.value = true;
                        });
                        scroll.animateTo(
                          200.0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        size: 36,
                        color: isSecondProduct.value ? greyTxt : blackText,
                      )),
                  id: widget.callSessionData!.store!.id!,
                );
              },
              error: (error) {
                return const Center(child: Text('Server error'));
              },
            );
          }),
          const SizedBox(
            height: 20,
          ),
          isSecondProduct.value
              ? Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<ProductBloc, ResultState<List<ProductModel>>>(
                        builder: (context, state) {
                      return state.when(
                        idle: () {
                          return const SizedBox();
                        },
                        loading: () {
                          return const SizedBox();
                        },
                        data: (data) {
                          List<ProductModel> products = data!;

                          return ProductDetails(
                            products: products,
                            productName: secondProduct,
                            productDescription: secondProduct.text,
                            productQuantity: secondProductQuantity.value,
                            onChanged: (item) async {
                              secondProduct.text = item!.logisticalDescription!;

                              final selectedProduct = item;
                              selectedProduct.product = item.id;
                              selectedProduct.id = null;
                              selectedProduct.stockLevel = null;
                              productList.add(selectedProduct);
                              DataModel.updateDataModel(details: productList);
                              final data = await DataModel.get();
                              log(data!.details!.length.toString());
                              log('this is data model second element');
                              log(data.details!
                                  .elementAt(1)
                                  .toJson()
                                  .toString());
                            },
                            decrement: () {
                              setState(() {
                                secondProductQuantity.value =
                                    secondProductQuantity.value - 1;
                                if (productList.length > 1) {
                                  productList[1].quantity =
                                      secondProductQuantity.value;
                                  log(productList[1].toJson().toString());
                                }
                              });
                            },
                            increment: () {
                              setState(() {
                                secondProductQuantity.value =
                                    secondProductQuantity.value + 1;
                                if (productList.length > 1) {
                                  productList[1].quantity =
                                      secondProductQuantity.value;
                                  log(productList[1].toJson().toString());
                                }
                              });
                            },
                            trailing: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isSecondProduct.value = false;
                                    log(isSecondProduct.value.toString());
                                    if (productList.length > 1) {
                                      productList.removeLast();
                                    }
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  size: 36,
                                  color: greyTxt,
                                )),
                            id: widget.callSessionData!.store!.id!,
                          );
                        },
                        error: (error) {
                          return const Center(child: Text('Server error'));
                        },
                      );
                    }),
                  ],
                )
              : const SizedBox.shrink(),
          const SizedBox(
            height: 20,
          ),
          _editableContainer(
              75,
              "Store Name",
              false,
              null,
              false,
              widget.callSessionData!.store!.name!,
              storeNameController,
              false, (text) {
            if (text.isNotEmpty) {
              int parsedValue = int.tryParse(text) ?? 0;

              DataModel.updateDataModel(totalPrice: parsedValue);
            } else {
              DataModel.updateDataModel(totalPrice: 0);
            }
          }),
          const SizedBox(
            height: 20,
          ),
          _editableContainer(
              75,
              "Price",
              false,
              null,
              true,
              widget.callSessionData!.totalPrice.toString(),
              priceController,
              true, (text) {
            if (text.isNotEmpty) {
              int parsedValue = int.tryParse(text) ?? 0;

              DataModel.updateDataModel(totalPrice: parsedValue);
            } else {
              DataModel.updateDataModel(totalPrice: 0);
            }
          }),
          const SizedBox(
            height: 20,
          ),
          _editableContainer(
              75,
              "Customer Name",
              false,
              null,
              true,
              widget.callSessionData!.customerName!,
              customerNameController,
              false, (text) {
            DataModel.updateDataModel(customerName: text);
          }),
          const SizedBox(
            height: 20,
          ),
          _editableContainer(
              75,
              "Customer Phone",
              true,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.call,
                      color: mainColor,
                      size: 30,
                    ),
                    onPressed: () {
                      print(phoneController.text);
                      _launchURL(
                          url: Uri(
                        scheme: 'tel',
                        path: phoneController.text,
                      ));
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add,
                      size: 30,
                      color: liteTxt,
                    ),
                    onPressed: () {
                      setState(() {
                        isSecondPhone = true;
                      });
                      scroll.animateTo(
                        250.0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ],
              ),
              true,
              "",
              phoneController,
              true, (text) {
            DataModel.updateDataModel(customerPhone: text);
          }),
          const SizedBox(
            height: 15,
          ),
          isSecondPhone
              ? _editableContainer(
                  75,
                  "SecondPhone",
                  true,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.call,
                          color: mainColor,
                          size: 30,
                        ),
                        onPressed: () {
                          print(secondPhone.text);
                          _launchURL(
                              url: Uri(
                            scheme: 'tel',
                            path: secondPhone.text,
                          ));
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          size: 30,
                          color: liteTxt,
                        ),
                        onPressed: () {
                          setState(() {
                            isSecondPhone = false;
                          });
                        },
                      ),
                    ],
                  ),
                  true,
                  "",
                  secondPhone,
                  true, (text) {
                  DataModel.updateDataModel(customerPhone2: secondPhone.text);
                })
              : const SizedBox.shrink()
        ]),
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
          style: const TextStyle(color: blackText, fontSize: 18),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: GoogleFonts.roboto(
                fontSize: 18, fontWeight: FontWeight.w500, color: liteTxt),
            labelText: title!,
            border: InputBorder.none,
            suffixIcon: isTrailing ? trailing : null,
            hintStyle: GoogleFonts.roboto(
              fontSize: 16,
              color: liteTxt,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          ),
        ));
  }
}
