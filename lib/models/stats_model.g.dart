// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatsModelAdapter extends TypeAdapter<StatsModel> {
  @override
  final int typeId = 3;

  @override
  StatsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatsModel(
      pendingOrders: fields[0] as int?,
      ordersCallback: fields[1] as int?,
      ordersPostponed: fields[2] as int?,
      orderToBeConfirmed: fields[3] as int?,
      ordersConfirmed: fields[4] as int?,
      ordersCancelled: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, StatsModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.pendingOrders)
      ..writeByte(1)
      ..write(obj.ordersCallback)
      ..writeByte(2)
      ..write(obj.ordersPostponed)
      ..writeByte(3)
      ..write(obj.orderToBeConfirmed)
      ..writeByte(4)
      ..write(obj.ordersConfirmed)
      ..writeByte(5)
      ..write(obj.ordersCancelled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatsModel _$StatsModelFromJson(Map<String, dynamic> json) => StatsModel(
      pendingOrders: json['orders_pending'] as int?,
      ordersCallback: json['orders_callback'] as int?,
      ordersPostponed: json['orders_postponed_to_today'] as int?,
      orderToBeConfirmed: json['orders_2b_confirmed'] as int?,
      ordersConfirmed: json['orders_confirmed_today'] as int?,
      ordersCancelled: json['orders_cancelled_today'] as int?,
    );

Map<String, dynamic> _$StatsModelToJson(StatsModel instance) =>
    <String, dynamic>{
      'orders_pending': instance.pendingOrders,
      'orders_callback': instance.ordersCallback,
      'orders_postponed_to_today': instance.ordersPostponed,
      'orders_2b_confirmed': instance.orderToBeConfirmed,
      'orders_confirmed_today': instance.ordersConfirmed,
      'orders_cancelled_today': instance.ordersCancelled,
    };
