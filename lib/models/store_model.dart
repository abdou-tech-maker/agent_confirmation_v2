import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'store_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 6)
class StoreModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  @JsonKey(name: "sheet_id")
  int? sheetId;
  StoreModel({required this.id, required this.name, required this.sheetId});
  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreModelToJson(this);
}
