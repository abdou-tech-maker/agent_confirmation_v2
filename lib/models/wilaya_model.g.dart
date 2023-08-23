// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wilaya_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WilayaModelAdapter extends TypeAdapter<WilayaModel> {
  @override
  final int typeId = 8;

  @override
  WilayaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WilayaModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WilayaModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WilayaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WilayaModel _$WilayaModelFromJson(Map<String, dynamic> json) => WilayaModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$WilayaModelToJson(WilayaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
