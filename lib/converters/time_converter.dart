import 'package:easy_localization/easy_localization.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

class TimeConverter implements JsonConverter<TimeOfDay?, String?> {
  const TimeConverter();

  @override
  TimeOfDay fromJson(String? json) {
    if (json == null) return TimeOfDay.now();
    if (json.contains(".")) {
      json = json.substring(0, json.length - 1);
    }

    return TimeOfDay.now(); //getTime(json);
  }

  @override
  String toJson(TimeOfDay? json) {
    json ??= TimeOfDay.now();
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, json.hour, json.minute, now.second);
    final format = DateFormat.jms('fr');
    return format.format(dt);
  }
}
