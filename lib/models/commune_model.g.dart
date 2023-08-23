// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commune_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommuneModelAdapter extends TypeAdapter<CommuneModel> {
  @override
  final int typeId = 9;

  @override
  CommuneModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommuneModel(
      id: fields[0] as int?,
      name: fields[2] as String?,
      communeArabe: fields[3] as String?,
      postcode: fields[4] as int?,
      wilaya: fields[1] as int?,
      zone: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CommuneModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.wilaya)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.communeArabe)
      ..writeByte(4)
      ..write(obj.postcode)
      ..writeByte(5)
      ..write(obj.zone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommuneModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommuneModel _$CommuneModelFromJson(Map<String, dynamic> json) => CommuneModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      communeArabe: json['commune_ar'] as String?,
      postcode: json['postcode'] as int?,
      wilaya: json['wilaya'] as int?,
      zone: json['zone'] as int?,
    );

Map<String, dynamic> _$CommuneModelToJson(CommuneModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wilaya': instance.wilaya,
      'name': instance.name,
      'commune_ar': instance.communeArabe,
      'postcode': instance.postcode,
      'zone': instance.zone,
    };
