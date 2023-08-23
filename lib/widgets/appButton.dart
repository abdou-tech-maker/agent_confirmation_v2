// ignore_for_file: file_names

import 'package:agent_confirmation/constantes/constantes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.padding,
      this.height,
      this.fontSize,
      this.radius});
  final String text;
  final VoidCallback onPressed;
  final EdgeInsets? padding;
  final double? radius;
  final double? height;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: padding ?? const EdgeInsets.only(left: 15, right: 15),
        backgroundColor: mainColor,
        fixedSize: Size(double.infinity, height ?? 55),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 6)),
      ),
      child: Text(
        text,
        style: GoogleFonts.roboto(
            fontSize: fontSize ?? 22,
            fontWeight: FontWeight.w500,
            color: Colors.white),
      ),
    );
  }
}
