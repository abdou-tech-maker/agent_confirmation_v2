import 'package:easy_localization/easy_localization.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:jiffy/jiffy.dart';

class JiffyFullConverter implements JsonConverter<Jiffy?, String?> {
  const JiffyFullConverter();

  @override
  Jiffy? fromJson(String? json) {
    if (json == null) return Jiffy();
    if (json.contains(".")) {
      json = json.substring(0, json.length - 1);
    }
    //print("converting $json to jiffy");
    DateTime tempDate = Intl.withLocale('en', () => DateFormat("yyyy-MM-dd").parse(json!));
    return Jiffy(tempDate);
    //return Jiffy(json, "yyyy-MM-dd");
  }

  @override
  String? toJson(Jiffy? json) => json?.dateTime.toIso8601String() ?? Jiffy().dateTime.toIso8601String();
}
