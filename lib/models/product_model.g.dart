// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 7;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      id: fields[0] as String?,
      logisticalDescription: fields[1] as String?,
      product: fields[2] as String?,
      quantity: fields[3] as int?,
    )..stockLevel = fields[4] as int?;
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.logisticalDescription)
      ..writeByte(2)
      ..write(obj.product)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.stockLevel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String?,
      logisticalDescription: json['logistical_description'] as String?,
      product: json['product'] as String?,
      quantity: json['quantity'] as int?,
    )..stockLevel = json['low_stock_level'] as int?;

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logistical_description': instance.logisticalDescription,
      'product': instance.product,
      'quantity': instance.quantity,
      'low_stock_level': instance.stockLevel,
    };
