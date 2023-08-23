// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataModelAdapter extends TypeAdapter<DataModel> {
  @override
  final int typeId = 13;

  @override
  DataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataModel(
      status: fields[0] as int?,
      callBackReason: fields[1] as int?,
      cancellationReason: fields[2] as int?,
      postponedDate: fields[3] as String?,
      orderid: fields[4] as String?,
      commune: fields[5] as int?,
      noteToDriver: fields[7] as String?,
      totalPrice: fields[6] as int?,
      customerAddress: fields[11] as String?,
      customerName: fields[8] as String?,
      customerPhone: fields[9] as String?,
      customerPhone2: fields[10] as String?,
      details: (fields[12] as List?)?.cast<ProductModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, DataModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.callBackReason)
      ..writeByte(2)
      ..write(obj.cancellationReason)
      ..writeByte(3)
      ..write(obj.postponedDate)
      ..writeByte(4)
      ..write(obj.orderid)
      ..writeByte(5)
      ..write(obj.commune)
      ..writeByte(6)
      ..write(obj.totalPrice)
      ..writeByte(7)
      ..write(obj.noteToDriver)
      ..writeByte(8)
      ..write(obj.customerName)
      ..writeByte(9)
      ..write(obj.customerPhone)
      ..writeByte(10)
      ..write(obj.customerPhone2)
      ..writeByte(11)
      ..write(obj.customerAddress)
      ..writeByte(12)
      ..write(obj.details);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      status: json['status'] as int?,
      callBackReason: json['callBackReason'] as int?,
      cancellationReason: json['cancellationReason'] as int?,
      postponedDate: json['postponedDate'] as String?,
      orderid: json['orderid'] as String?,
      commune: json['commune'] as int?,
      noteToDriver: json['note_to_driver'] as String?,
      totalPrice: json['total_price'] as int?,
      customerAddress: json['customer_address'] as String?,
      customerName: json['customer_name'] as String?,
      customerPhone: json['customer_phone'] as String?,
      customerPhone2: json['customer_phone_2'] as String?,
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'status': instance.status,
      'callBackReason': instance.callBackReason,
      'cancellationReason': instance.cancellationReason,
      'postponedDate': instance.postponedDate,
      'orderid': instance.orderid,
      'commune': instance.commune,
      'total_price': instance.totalPrice,
      'note_to_driver': instance.noteToDriver,
      'customer_name': instance.customerName,
      'customer_phone': instance.customerPhone,
      'customer_phone_2': instance.customerPhone2,
      'customer_address': instance.customerAddress,
      'details': instance.details,
    };
