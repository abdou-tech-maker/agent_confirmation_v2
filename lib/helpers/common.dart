import 'package:agent_confirmation/constantes/constantes.dart';
import 'package:agent_confirmation/widgets/appButton.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../models/auth_token.dart';
import '../models/user_model.dart';

Future<void> clearUser() async {
  await AuthToken.clearAll();
  await UserModel.clear();
}

loader({Function()? onCancel, String? msg}) {
  if (msg != null) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            strokeWidth: 3.0,
          ),
          const SizedBox(width: 10),
          Text(
            msg,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  return const Center(child: CircularProgressIndicator());
}

Future<void> connectAndListen(String? token) async {
  if (token == null) {
    token = await AuthToken.getToken();
    if (token == null) {
      return;
    } else {
      debugPrint("socket key = Bearer $token");
    }
  }
}

Widget showWidget(Widget widgets, Widget elseWidgets, bool show) {
  if (show) {
    return widgets;
  } else {
    return elseWidgets;
  }
}

void showActionMessage(BuildContext context,
    {String title = "agent_confirmation",
    List<Widget>? messages,
    String? positiveBtn,
    String? negativeBtn,
    Function(String)? whichTaped,
    bool dissmiss = true,
    bool barrierDismissible = false}) {
  String result = "";
  showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible, // user must tap button!

      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: messages!,
            ),
          ),
          actions: <Widget>[
            negativeBtn != null
                ? TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: mainColor)),
                    onPressed: () {
                      Navigator.of(context).pop();
                      result = 'Negative';
                    },
                    child: Text(
                      negativeBtn,
                      style: const TextStyle(color: mainColor),
                    ),
                  )
                : const SizedBox(),
            positiveBtn != null
                ? TextButton(
                    child: Text(
                      positiveBtn,
                    ),
                    onPressed: () async {
                      if (dissmiss) {
                        //WidgetsBinding.instance!.addPostFrameCallback((_) async {
                        Navigator.of(context).pop();
                        //});
                      }
                      result = 'Positive';
                    },
                  )
                : const SizedBox(),
          ],
        );
      }).then((value) => {if (whichTaped != null) whichTaped(result)});
}

showLoaderDialog(BuildContext context, {String? message}) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
        const CircularProgressIndicator(),
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(left: 7),
              child: Text(message ?? "Sending data".tr())),
        )
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showConfirmDialog(BuildContext context,
    {List<Widget>? messages, String? okButtonTxt, Function()? onTap}) {
  showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          contentPadding:
              const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
          actionsPadding: const EdgeInsets.only(bottom: 30),
          content: SingleChildScrollView(
            child: ListBody(
              children: messages ?? [],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  child: MyButton(
                    // textSize: 16,
                    radius: 8,
                    //  text: okButtonTxt,
                    padding: const EdgeInsets.only(
                        top: 1, bottom: 1, left: 60, right: 60),
                    onPressed: () async {
                      if (onTap != null) {
                        Navigator.of(context, rootNavigator: true).pop();
                        onTap();
                      }
                    },
                    text: 'Ok',
                  ),
                ),
              ],
            ),
          ],
        );
      }).then((value) {});
}
