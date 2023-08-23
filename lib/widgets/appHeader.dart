// ignore_for_file: file_names

import 'dart:io';

import 'package:agent_confirmation/constantes/constantes.dart';
import 'package:agent_confirmation/models/user_picture.dart';
import 'package:flutter/material.dart';
import 'package:agent_confirmation/pages/profile.dart';
import 'package:hive_flutter/adapters.dart';

class MyHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyHeader({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: 14,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: blackText,
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: ValueListenableBuilder<Box<UserPicture>>(
              valueListenable:
                  Hive.box<UserPicture>('UserPicture').listenable(),
              builder: (context, value, child) {
                //  log("user Picrure updated ${value.values.first.toJson()}");
                if (value.isEmpty) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const Profile()),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 15,
                    ),
                  );
                } else {
                  final userPicture = value.values.first;
                  // log(' this is the user picture $userPicture');
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const Profile()),
                      );
                    },
                    child: CircleAvatar(
                      radius: 15,
                      backgroundImage: userPicture.path != null
                          ? FileImage(File(userPicture.path!))
                          : null,
                    ),
                  );
                }
              },
            )),
      ],
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 24, color: blackText, fontWeight: FontWeight.bold),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
