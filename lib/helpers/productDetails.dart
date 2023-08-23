// ignore_for_file: file_names

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constantes/constantes.dart';
import '../models/product_model.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails(
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
      required this.products});
  final double? height;
  final TextEditingController? productName;
  final String? productDescription;
  final int? productQuantity;
  final void Function(ProductModel?)? onChanged;
  final void Function()? decrement;
  final void Function()? increment;
  final Widget trailing;
  final String id;
  final List<ProductModel>? products;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    super.initState();
  }

  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: DropdownSearch<ProductModel>(
                  mode: Mode.MENU,
                  items: widget.products,
                  dropdownSearchDecoration: InputDecoration(
                    hintText: widget.productName?.text,
                    hintStyle: GoogleFonts.roboto(fontSize: 14, color: liteTxt),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                  onChanged: widget.onChanged,
                  showSearchBox: true,
                  showClearButton: false,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      hintStyle:
                          GoogleFonts.poppins(fontSize: 14, color: liteTxt),
                      hintText: 'Search .. ',
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                  itemAsString: (ProductModel? product) =>
                      "${product?.logisticalDescription} -   (${product?.stockLevel ?? 0})",
                  dropdownBuilder: (
                    BuildContext context,
                    ProductModel? item,
                  ) {
                    if (item?.logisticalDescription != null) {
                      return Text(
                        item!.logisticalDescription!,
                        style: GoogleFonts.poppins(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Text(
                          item?.logisticalDescription ??
                              widget.productName!.text,
                          style: GoogleFonts.poppins(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }
                  }),
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
                  //widget.productDescription ?? "",
                  "No Description",
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
