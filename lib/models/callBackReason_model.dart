// ignore_for_file: file_names

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'callBackReason_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 10)
class CallBackReasonModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;

  CallBackReasonModel({required this.id, required this.name});
  factory CallBackReasonModel.fromJson(Map<String, dynamic> json) =>
      _$CallBackReasonModelFromJson(json);

  Map<String, dynamic> toJson() => _$CallBackReasonModelToJson(this);
}
