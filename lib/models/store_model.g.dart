// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StoreModelAdapter extends TypeAdapter<StoreModel> {
  @override
  final int typeId = 6;

  @override
  StoreModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StoreModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      sheetId: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, StoreModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.sheetId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoreModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => StoreModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      sheetId: json['sheet_id'] as int?,
    );

Map<String, dynamic> _$StoreModelToJson(StoreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sheet_id': instance.sheetId,
    };
