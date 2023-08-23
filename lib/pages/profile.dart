import 'dart:developer';
import 'dart:io';

import 'package:agent_confirmation/constantes/constantes.dart';
import 'package:agent_confirmation/widgets/customeAppBar.dart';
import 'package:agent_confirmation/pages/login/loginPage.dart' as login;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../models/auth_token.dart';
import '../models/user_model.dart';
import '../models/user_picture.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ImagePicker imagePicker = ImagePicker();
  XFile? image;

  signOut() async {
    await AuthToken.clearAll().then(
        (value) => SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              /*  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                context,
                settings: const RouteSettings(name: ""),
                screen: const login.Login(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );*/
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  maintainState: false,
                  builder: (context) => const login.Login(),
                ),
                (route) => false,
              );
            }));
  }

  void selectImages() async {
    final XFile? selectedImage = await imagePicker.pickImage(
        imageQuality: 25, source: ImageSource.gallery);
    setState(() {
      image = selectedImage!;
    });
    if (image != null) {
      final userPicture = UserPicture(path: image!.path);
      UserPicture.set(userPicture);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      appBar: const MyAppBar(
        title: 'My Profile',
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
        child: ValueListenableBuilder<Box<UserModel>>(
          valueListenable: Hive.box<UserModel>('UserModel').listenable(),
          builder: (context, value, child) {
            return _body(context, value.values.first);
          },
        ),
      ),
    );
  }

  Widget _body(BuildContext context, UserModel user) {
    return ListView(children: [
      Center(
        child: SizedBox(
          height: 150,
          child: Stack(children: [
            ValueListenableBuilder<Box<UserPicture>>(
              valueListenable:
                  Hive.box<UserPicture>('UserPicture').listenable(),
              builder: (context, box, child) {
                if (box.isEmpty) {
                  return const CircleAvatar(
                    radius: 75,
                    backgroundColor: mainColor,
                  );
                }

                final userPictures = box.values.toList();
                log("${box.values.toList()}");
                if (userPictures.isEmpty) {
                  return const CircleAvatar(
                    radius: 75,
                    backgroundColor: mainColor,
                  );
                }

                final userPicture = userPictures.first;

                return CircleAvatar(
                  radius: 75,
                  backgroundImage: userPicture.path != null
                      ? FileImage(File(userPicture.path!))
                      : null,
                );
              },
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: mainColor,
                child: IconButton(
                  icon: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    selectImages();
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      _profileTile(
        user.fullname,
        "Agent Full Name",
        const Icon(
          Icons.group,
          color: mainColor,
        ),
        true,
      ),
      _profileTile(
          user.username,
          "Username",
          const Icon(
            Icons.person,
            color: mainColor,
          ),
          true),
      _profileTile(
          user.id.toString(),
          "Email",
          const Icon(
            Icons.alternate_email,
            color: mainColor,
          ),
          true),
      _profileTile(
        user.phone ?? "+213666666666",
        "Phone number",
        const Icon(
          Icons.phone,
          color: mainColor,
        ),
        true,
      ),
      _profileTile(
          user.role,
          "Bank / CCP Account",
          const Icon(
            Icons.payments_outlined,
            color: mainColor,
          ),
          true),
      InkWell(
        onTap: () {
          signOut();
        },
        child: _profileTile(
            "Log Out",
            "",
            const Icon(
              Icons.power_settings_new,
              color: mainColor,
            ),
            false),
      ),
      const SizedBox(height: 40),
      Image.asset(
        "assets/images/maystro-blue 1.png",
        width: 150,
        height: 80,
      ),
    ]);
  }

  Widget _profileTile(
      dynamic maintext, String header, Widget? icon, bool isTitle) {
    return SizedBox(
      height: 60,
      child: ListTile(
        leading: icon,
        dense: true,
        isThreeLine: true,
        title: isTitle
            ? Text(
                header,
                style: GoogleFonts.roboto(
                    color: liteTxt, fontSize: 12, fontWeight: FontWeight.w500),
              )
            : const SizedBox.shrink(),
        subtitle: Text(
          maintext,
          style: GoogleFonts.roboto(
              color: blackText, fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
