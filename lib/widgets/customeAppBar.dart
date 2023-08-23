// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:agent_confirmation/constantes/constantes.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? widget;

  const MyAppBar({Key? key, required this.title, this.widget})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 22, color: blackText, fontWeight: FontWeight.bold),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Padding(
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
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              textDirection: TextDirection.ltr,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}
