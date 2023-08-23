// ignore_for_file: file_names

import 'package:agent_confirmation/api/api_repository.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constantes/constantes.dart';
import '../models/product_model.dart';

class Test extends StatefulWidget {
  const Test(
      {super.key,
      this.height,
      this.productName,
      this.productDescription,
      this.productQuantity,
      this.onChanged,
      this.decrement,
      this.increment,
      required this.trailing,
      required this.id,
      required this.keyy});
  final double? height;
  final TextEditingController? productName;
  final String? productDescription;
  final int? productQuantity;
  final dynamic Function(ProductModel?)? onChanged;
  final void Function()? decrement;
  final void Function()? increment;
  final Widget trailing;
  final String id;
  final GlobalKey<AutoCompleteTextFieldState<ProductModel?>> keyy;

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  ApiRepository api = ApiRepository();
  List<ProductModel?> productList = [];
  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  Future<void> fetchProducts() async {
    List<ProductModel?> products = await api.getProducts(widget.id, null);
    // if (mounted) {
    setState(() {
      productList = products.whereType<ProductModel>().toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(
            child: Container(
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: greyTxt, width: 0.5),
                color: Colors.white,
              ),
              child: AutoCompleteTextField<ProductModel?>(
                key: widget.keyy,
                controller: widget.productName,
                suggestions: productList,
                clearOnSubmit: false,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: liteTxt),
                  labelText: 'Product Name',
                  hintText: '',
                  hintStyle: GoogleFonts.roboto(
                    fontSize: 16,
                    color: liteTxt,
                  ),
                  border: InputBorder.none,
                ),
                itemFilter: (item, query) => item!.logisticalDescription!
                    .toLowerCase()
                    .startsWith(query.toLowerCase()),
                itemSorter: (a, b) => a!.logisticalDescription!
                    .compareTo(b!.logisticalDescription!),
                itemSubmitted: widget.onChanged,
                itemBuilder: (context, item) {
                  return ListTile(
                    title: Text(
                        "${item?.logisticalDescription}   (${item?.stockLevel ?? ''})"),
                  );
                },
              ),
            ),
          ),
          widget.trailing
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: liteTxt, width: 0.5),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)),
        height: 120,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Product Description",
                textAlign: TextAlign.start,
                style: GoogleFonts.roboto(
                    fontSize: 13, fontWeight: FontWeight.w500, color: liteTxt),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  textAlign: TextAlign.start,
                  widget.productDescription ?? "",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: greyTxt),
                ),
              ),
            ),
          ]),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Product Quantity',
            style: GoogleFonts.roboto(
                fontSize: 14, fontWeight: FontWeight.w500, color: blackText),
          ),
          Row(
            children: [
              Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: liteTxt, width: 0.5),
                      color: mainColor,
                      borderRadius: BorderRadius.circular(6)),
                  height: 30,
                  width: 30,
                  child: Center(
                    child: IconButton(
                        padding: const EdgeInsets.all(0),
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        onPressed: widget.decrement),
                  )),
              Container(
                height: 30,
                width: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    widget.productQuantity.toString(),
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: blackText),
                  ),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: liteTxt, width: 0.5),
                      color: mainColor,
                      borderRadius: BorderRadius.circular(6)),
                  height: 30,
                  width: 30,
                  child: IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: widget.increment)),
            ],
          )
        ],
      ),
    ]);
  }
}
