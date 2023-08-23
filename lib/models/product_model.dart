import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 7)
class ProductModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  @JsonKey(name: "logistical_description")
  String? logisticalDescription;
  @HiveField(2)
  String? product;
  @HiveField(3)
  int? quantity;
  @HiveField(4)
  @JsonKey(name: 'low_stock_level')
  int? stockLevel;

  ProductModel(
      {required this.id,
      required this.logisticalDescription,
      required this.product,
      required this.quantity,
      this.stockLevel});
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  ProductModel updateStockLevel(int newStock) {
    return ProductModel(
      id: id,
      logisticalDescription: logisticalDescription,
      product: product,
      quantity: quantity,
      stockLevel: newStock,
    );
  }

  ProductModel updateId(String? newId) {
    return ProductModel(
      id: newId,
      logisticalDescription: logisticalDescription,
      product: product,
      quantity: quantity,
      stockLevel: stockLevel,
    );
  }

  ProductModel updateProduct(String? newProduct) {
    return ProductModel(
      id: id,
      logisticalDescription: logisticalDescription,
      product: newProduct,
      quantity: quantity,
      stockLevel: stockLevel,
    );
  }
}
