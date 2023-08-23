// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constantes/constantes.dart';
import '../helpers/gradientProgress.dart';

class StatsHolder extends StatelessWidget {
  const StatsHolder({
    super.key,
    required this.backGroundColor,
    required this.path,
    required this.header,
    required this.maintext,
    this.width,
    required this.isProgress,
    this.subText,
    required this.isSubtitle,
    this.headColor,
    this.subColor,
    this.trailing,
    this.total,
    this.accomplished,
    this.percentage,
    required this.isPercentage,
    this.percentageIcon,
    this.percentageColor,
    this.height,
    this.headerFont,
  });
  final String? subText;
  final bool isSubtitle;
  final String path;
  final String header;
  final String maintext;
  final double? width;
  final Color? subColor;
  final Color? headColor;
  final Widget? trailing;
  final bool isProgress;
  final int? accomplished;
  final int? total;
  final String? percentage;
  final bool isPercentage;
  final IconData? percentageIcon;
  final Color? percentageColor;
  final double? height;
  final double? headerFont;
  final Color backGroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      height: height ?? 75,
      width: width ?? double.infinity,
      child: ListTile(
        isThreeLine: false,
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backGroundColor,
          ),
          child: Image.asset(
            path,
            height: 40,
            width: 40,
            color: Colors.white,
          ),
        ),
        title: Text(
          header,
          style: GoogleFonts.poppins(
              color: headColor ?? headerColor,
              fontSize: headerFont ?? 11,
              fontWeight: FontWeight.w500),
        ),
        subtitle: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  maintext,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                      color: blackText,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  isSubtitle ? subText! : "",
                  style: GoogleFonts.poppins(
                      color: subColor ?? mainColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 3,
                ),
                isPercentage
                    ? Row(
                        children: [
                          Icon(
                            percentageIcon,
                            color: percentageColor,
                            size: 10,
                          ),
                          Text(
                            percentage ?? "",
                            style: GoogleFonts.poppins(
                                color: percentageColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    : const SizedBox.shrink()
              ],
            ),
            isProgress
                ? GradientProgressBar(
                    accomplished: accomplished!,
                    highColor: progressGradient.colors.last,
                    lowColor: progressGradient.colors.first,
                    middleColor: progressGradient.colors.elementAt(1),
                    total: total!,
                  )
                : const SizedBox()
          ],
        ),
        trailing: trailing,
      ),
    );
  }
}
