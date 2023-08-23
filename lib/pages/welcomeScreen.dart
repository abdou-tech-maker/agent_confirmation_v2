// ignore_for_file: file_names

import 'package:agent_confirmation/constantes/constantes.dart';
import 'package:agent_confirmation/pages/login/loginPage.dart';
import 'package:agent_confirmation/pages/mainScreen.dart';
import 'package:agent_confirmation/widgets/appButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Helpers/common.dart';
import '../models/auth_token.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<bool>(
          future: AuthToken.isLogged(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == true) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                });
              } else {
                return _body(context);
              }
            }
            return loader();
          },
        ),
      ),
    );
  }
}

Widget _body(BuildContext context) {
  return Stack(
    children: [
      Positioned(
        top: 0,
        bottom: 0,
        right: 0,
        left: 0,
        child: Image.asset(
          'assets/images/compress.jpg',
          fit: BoxFit.cover,
        ),
        //),
      ),
      Positioned(
          top: 90,
          right: 8,
          left: 7,
          height: 189,
          child: Image.asset('assets/images/maystro-white 1.png')),
      Positioned(
          top: 280,
          right: 2,
          left: 2,
          height: 189,
          child: Padding(
              padding: const EdgeInsets.only(
                right: 22,
                left: 22,
              ),
              child: Text(
                'AGENTS CONFIRMATION',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 4),
              ))),
      Positioned(
          bottom: 111,
          left: 15,
          right: 15,
          child: MyButton(
              text: 'Log in',
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              })),
      Positioned(
          bottom: 49,
          left: 72,
          right: 72,
          child: Column(
            children: [
              Text(
                'By continuing, you agree to Maystro\'s Terms &',
                maxLines: 1,
                style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Center(
                  child: Text(
                "Privacy Policy",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ))
            ],
          )),
      Positioned(
          bottom: 7, left: 171.88, right: 171.88, child: buildDragHandle())
    ],
  );
}

Widget buildDragHandle() {
  return InkWell(
    //  onTap: togglePanel(),
    child: Center(
      child: Container(
        width: 46.24,
        height: 6,
        decoration: BoxDecoration(
            color: liteTxt, borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
