import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wilaya_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 8)
class WilayaModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;

  WilayaModel({required this.id, required this.name});

  factory WilayaModel.fromJson(Map<String, dynamic> json) =>
      _$WilayaModelFromJson(json);

  Map<String, dynamic> toJson() => _$WilayaModelToJson(this);
}
