// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_session.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CallSessionModelAdapter extends TypeAdapter<CallSessionModel> {
  @override
  final int typeId = 5;

  @override
  CallSessionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CallSessionModel(
      status: fields[0] as int?,
      customerName: fields[1] as String?,
      customerPhone: fields[2] as String?,
      customerPhone2: fields[3] as String?,
      callbackReason: fields[17] as int?,
      cancellationReason: fields[15] as int?,
      cancelledAt: fields[14] as String?,
      cofirmedAt: fields[12] as String?,
      commune: fields[10] as int?,
      customerAddress: fields[4] as String?,
      details: (fields[16] as List?)?.cast<ProductModel>(),
      displayId: fields[18] as int?,
      noteToDriver: fields[8] as String?,
      postponedTo: fields[13] as String?,
      store: fields[9] as StoreModel?,
      totalPrice: fields[7] as int?,
      uploadCommune: fields[6] as String?,
      uploadWilaya: fields[5] as String?,
      wilaya: fields[11] as int?,
      id: fields[19] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CallSessionModel obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.customerName)
      ..writeByte(2)
      ..write(obj.customerPhone)
      ..writeByte(3)
      ..write(obj.customerPhone2)
      ..writeByte(4)
      ..write(obj.customerAddress)
      ..writeByte(5)
      ..write(obj.uploadWilaya)
      ..writeByte(6)
      ..write(obj.uploadCommune)
      ..writeByte(7)
      ..write(obj.totalPrice)
      ..writeByte(8)
      ..write(obj.noteToDriver)
      ..writeByte(9)
      ..write(obj.store)
      ..writeByte(10)
      ..write(obj.commune)
      ..writeByte(11)
      ..write(obj.wilaya)
      ..writeByte(12)
      ..write(obj.cofirmedAt)
      ..writeByte(13)
      ..write(obj.postponedTo)
      ..writeByte(14)
      ..write(obj.cancelledAt)
      ..writeByte(15)
      ..write(obj.cancellationReason)
      ..writeByte(16)
      ..write(obj.details)
      ..writeByte(17)
      ..write(obj.callbackReason)
      ..writeByte(18)
      ..write(obj.displayId)
      ..writeByte(19)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CallSessionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallSessionModel _$CallSessionModelFromJson(Map<String, dynamic> json) =>
    CallSessionModel(
      status: json['status'] as int?,
      customerName: json['customer_name'] as String?,
      customerPhone: json['customer_phone'] as String?,
      customerPhone2: json['customer_phone_2'] as String?,
      callbackReason: json['callback_reason'] as int?,
      cancellationReason: json['cancellation_reason'] as int?,
      cancelledAt: json['cancelled_at'] as String?,
      cofirmedAt: json['confirmed_at'] as String?,
      commune: json['commune'] as int?,
      customerAddress: json['customer_address'] as String?,
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      displayId: json['display_id'] as int?,
      noteToDriver: json['note_to_driver'] as String?,
      postponedTo: json['postponed_to'] as String?,
      store: json['store'] == null
          ? null
          : StoreModel.fromJson(json['store'] as Map<String, dynamic>),
      totalPrice: json['total_price'] as int?,
      uploadCommune: json['upload_commune_name'] as String?,
      uploadWilaya: json['upload_wilaya_name'] as String?,
      wilaya: json['wilaya'] as int?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$CallSessionModelToJson(CallSessionModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'customer_name': instance.customerName,
      'customer_phone': instance.customerPhone,
      'customer_phone_2': instance.customerPhone2,
      'customer_address': instance.customerAddress,
      'upload_wilaya_name': instance.uploadWilaya,
      'upload_commune_name': instance.uploadCommune,
      'total_price': instance.totalPrice,
      'note_to_driver': instance.noteToDriver,
      'store': instance.store,
      'commune': instance.commune,
      'wilaya': instance.wilaya,
      'confirmed_at': instance.cofirmedAt,
      'postponed_to': instance.postponedTo,
      'cancelled_at': instance.cancelledAt,
      'cancellation_reason': instance.cancellationReason,
      'details': instance.details,
      'callback_reason': instance.callbackReason,
      'display_id': instance.displayId,
      'id': instance.id,
    };
