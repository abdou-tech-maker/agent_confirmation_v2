// ignore_for_file: file_names

import 'package:flutter/material.dart';

class GradientProgressBar extends StatelessWidget {
  final int total;
  final int accomplished;
  final Color lowColor;
  final Color middleColor;
  final Color highColor;
  const GradientProgressBar({
    super.key,
    required this.total,
    required this.accomplished,
    required this.lowColor,
    required this.middleColor,
    required this.highColor,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = accomplished / total;

    return Container(
      constraints: const BoxConstraints.expand(height: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: progress < 0.75
                      ? [lowColor, middleColor]
                      : [lowColor, middleColor, highColor],
                  stops: progress < 0.75 ? [0.3, 0.75] : [0.3, 0.75, 1.0],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
