// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const Color mainColor = Color(0xFF008AFF);
const Color liteTxt = Color(0xFFB3B3B3);
const Color blackText = Color(0xFF121212);
const Color backGround = Color(0xFFEDF2FF);
const Color selectedIcon = Color(0xFF008AFF);
const Color headerColor = Color(0xFFA8A8A8);
const Color greyTxt = Color(0xFF7C7C7C);
const Color unselectedIcon = Color(0xFF7EA2B7);
const Color iconColor = Color(0xFF111111);
const Color pending = Color.fromARGB(255, 194, 166, 253);
const Color hardPending = Color(0XFF8952FF);
const Color desactivatedButton = Color(0XFF526EFF);

const Color canceled = Color.fromARGB(255, 240, 124, 124);

const hardCanceled = Color(0xFFEB5757);

const Color confirmed = Color(0XFF16A34A);
const Color postponed = Color(0XFFFF8A00);
const Color callBackColor = Color.fromARGB(255, 109, 184, 250);

const progressGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFFF2E2E),
      Color(0xFFFF8A00),
      Color(0xFF24FF00),
    ]);
const LinearGradient linear = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.white,
      Color(0xFF827F7F),
    ]);
//const BASEURL =
//  "https://maystro-backend-nyg42cuu7q-uc.a.run.app/api/"; // dev Url
//const BASEURL =
//    "https://new-confirmation-backend-as6qwsolmq-ew.a.run.app/api/"; // Prod Url
const BASEURL = "https://mdcall-api.maystro-delivery.com/api/";
const AUTHORIZATION = "Authorization";
