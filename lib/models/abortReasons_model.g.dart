// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abortReasons_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AbortReasonsModelAdapter extends TypeAdapter<AbortReasonsModel> {
  @override
  final int typeId = 11;

  @override
  AbortReasonsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AbortReasonsModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AbortReasonsModel obj) {
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
      other is AbortReasonsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbortReasonsModel _$AbortReasonsModelFromJson(Map<String, dynamic> json) =>
    AbortReasonsModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$AbortReasonsModelToJson(AbortReasonsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
