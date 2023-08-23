// ignore_for_file: file_names

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'abortReasons_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 11)
class AbortReasonsModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;

  AbortReasonsModel({required this.id, required this.name});
  factory AbortReasonsModel.fromJson(Map<String, dynamic> json) =>
      _$AbortReasonsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AbortReasonsModelToJson(this);
}
