// ignore_for_file: file_names
import 'package:agent_confirmation/helpers/common.dart';

import 'package:agent_confirmation/constantes/constantes.dart';
import 'package:agent_confirmation/pages/mainScreen.dart';
import 'package:agent_confirmation/widgets/appButton.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agent_confirmation/states/result_state.dart';
import 'package:flutter/scheduler.dart';

import '../../bloc/blocs/login_bloc.dart';
import '../../bloc/events/user_event.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePassword = true;
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  void hideMyPass() {
    if (hidePassword) {
      setState(() {
        hidePassword = false;
      });
    } else {
      setState(() {
        hidePassword = true;
      });
    }
  }

  String? _errorMsg;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Form(
            key: _key,
            child: BlocBuilder<LoginBloc, ResultState>(
              builder: (context, state) {
                return state.when(
                  idle: () {
                    return _bodyForm();
                  },
                  loading: () {
                    return loader(msg: "Login in ...");
                  },
                  data: (data) {
                    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreen()));
                      BlocProvider.of<LoginBloc>(context)
                          .add(const UserEvent.distract());
                    });
                    return const SizedBox();
                  },
                  error: (error) {
                    _errorMsg = "The username or password do not match";
                    BlocProvider.of<LoginBloc>(context)
                        .add(const UserEvent.distract());

                    return const SizedBox();
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _bodyForm() {
    return ListView(
      shrinkWrap: true,
      children: [
        Image.asset("assets/images/maystro-blue 1.png"),
        Text(
          _errorMsg ?? "",
          style: const TextStyle(color: Colors.red),
        ),
        const SizedBox(height: 15),
        Text(
          'Log in to your account',
          style: GoogleFonts.poppins(
              color: blackText, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
            style:
                GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400),
            controller: userName,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.group,
                color: mainColor,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              labelText: 'Username',
              labelStyle: GoogleFonts.roboto(fontSize: 16, color: liteTxt),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            validator: (value) {
              return "Enter a valid email or Phone";
            }),
        const SizedBox(
          height: 30,
        ),
        TextFormField(
          controller: password,
          style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400),
          decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.lock,
                color: mainColor,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              labelText: 'Password',
              labelStyle: GoogleFonts.roboto(fontSize: 16, color: liteTxt),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              suffixIcon: IconButton(
                iconSize: 20,
                icon: hidePassword
                    ? const Icon(
                        Icons.visibility_off_sharp,
                        color: liteTxt,
                      )
                    : const Icon(
                        Icons.visibility_sharp,
                        color: liteTxt,
                      ),
                onPressed: hideMyPass,
              )),
          obscureText: hidePassword ? true : false,
        ),
        const SizedBox(
          height: 30,
        ),
        MyButton(
          onPressed: () {
            BlocProvider.of<LoginBloc>(context).add(UserEvent.login(
                userName.text.toString(), password.text.toString()));
          },
          text: 'Continue'.tr(),
        ),
        const SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.center,
          child: TextButton(
              onPressed: () {
                /*   Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                );*/
              },
              child: Text(
                'Forgot your password?',
                style: GoogleFonts.roboto(
                    color: blackText,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}

Widget buildDragHandle() {
  return InkWell(
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
