import 'package:easy_localization/easy_localization.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:jiffy/jiffy.dart';

class JiffyConverter implements JsonConverter<Jiffy?, String?> {
  const JiffyConverter();

  @override
  Jiffy fromJson(String? json) {
    if (json == null) return Jiffy();
    if (json.contains(".")) {
      json = json.substring(0, json.length - 1);
    }
    //print("converting $json to jiffy");
    DateTime tempDate = Intl.withLocale('en', () => DateFormat("yyyy-MM-dd").parse(json ?? Jiffy().dateTime.toIso8601String()));
    return Jiffy(tempDate);
    //return Jiffy(json, "yyyy-MM-dd");
  }

  @override
  String toJson(Jiffy? json) {
    if (json == null) return Jiffy().dateTime.toIso8601String();
    return json.dateTime.toIso8601String();
  }
}
