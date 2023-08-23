import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'commune_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 9)
class CommuneModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? wilaya;
  @HiveField(2)
  String? name;
  @HiveField(3)
  @JsonKey(name: "commune_ar")
  String? communeArabe;
  @HiveField(4)
  int? postcode;
  @HiveField(5)
  int? zone;
  CommuneModel(
      {required this.id,
      required this.name,
      required this.communeArabe,
      required this.postcode,
      required this.wilaya,
      required this.zone});

  factory CommuneModel.fromJson(Map<String, dynamic> json) =>
      _$CommuneModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommuneModelToJson(this);
}
