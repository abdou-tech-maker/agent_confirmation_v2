// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'callBackReason_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CallBackReasonModelAdapter extends TypeAdapter<CallBackReasonModel> {
  @override
  final int typeId = 10;

  @override
  CallBackReasonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CallBackReasonModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CallBackReasonModel obj) {
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
      other is CallBackReasonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallBackReasonModel _$CallBackReasonModelFromJson(Map<String, dynamic> json) =>
    CallBackReasonModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CallBackReasonModelToJson(
        CallBackReasonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
