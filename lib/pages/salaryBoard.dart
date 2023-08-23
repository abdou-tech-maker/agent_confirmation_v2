// ignore_for_file: file_names

import 'package:agent_confirmation/widgets/appHeader.dart';
import 'package:flutter/material.dart';
import 'package:agent_confirmation/constantes/constantes.dart';
import 'package:google_fonts/google_fonts.dart';

class SalaryBoard extends StatefulWidget {
  const SalaryBoard({super.key});

  @override
  State<SalaryBoard> createState() => _SalaryBoardState();
}

class _SalaryBoardState extends State<SalaryBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      appBar: const MyHeader(title: "Salary Board"),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: greyTxt, width: 0.5),
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
              onChanged: (text) => {},
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
      ]),
    );
  }
}
