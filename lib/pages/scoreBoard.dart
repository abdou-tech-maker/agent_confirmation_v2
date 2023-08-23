// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:agent_confirmation/constantes/constantes.dart';

import '../widgets/appHeader.dart';

class ScoreBoard extends StatefulWidget {
  const ScoreBoard({super.key});

  @override
  State<ScoreBoard> createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backGround,
      appBar: MyHeader(title: "Score Board"),
    );
  }
}
