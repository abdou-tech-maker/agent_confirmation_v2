// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:agent_confirmation/constantes/constantes.dart';

class DateWidget extends StatefulWidget {
  final Jiffy? defaultDate;
  final Function(Jiffy date) onResult;
  const DateWidget({
    Key? key,
    this.defaultDate,
    required this.onResult,
  }) : super(key: key);

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  TextEditingController inputDate = TextEditingController();
  Jiffy date = Jiffy();

  @override
  void initState() {
    if (widget.defaultDate != null) {
      inputDate.text = widget.defaultDate!.format('yyyy-MM-dd');
      date = widget.defaultDate!;
    }
    super.initState();
  }

  @override
  void dispose() {
    inputDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.poppins(fontSize: 16, color: blackText),
      controller: inputDate,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        border: InputBorder.none,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.calendar_today, color: blackText),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: widget.defaultDate?.dateTime ?? DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime(2100));

        if (pickedDate != null) {
          //pickedDate output format => 2021-03-10 00:00:00.000

          date = Jiffy(pickedDate);
          //formatted date output using intl package =>  2021-03-16

          //String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          //set output date to TextField value.

          setState(() {
            inputDate.text = date.format('yyyy-MM-dd');
          });
          widget.onResult(date);
        }
      },
    );
  }
}
