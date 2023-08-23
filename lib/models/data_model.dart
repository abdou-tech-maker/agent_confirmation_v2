// ignore_for_file: file_names, sdk_version_since

import 'package:agent_confirmation/models/product_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 13)
class DataModel {
  @HiveField(0)
  int? status;
  @HiveField(1)
  int? callBackReason;
  @HiveField(2)
  int? cancellationReason;
  @HiveField(3)
  String? postponedDate;
  @HiveField(4)
  String? orderid;
  @HiveField(5)
  int? commune;
  @HiveField(6)
  @JsonKey(name: "total_price")
  int? totalPrice;
  @HiveField(7)
  @JsonKey(name: "note_to_driver")
  String? noteToDriver;
  @HiveField(8)
  @JsonKey(name: "customer_name")
  String? customerName;
  @HiveField(9)
  @JsonKey(name: "customer_phone")
  String? customerPhone;
  @HiveField(10)
  @JsonKey(name: "customer_phone_2")
  String? customerPhone2;
  @HiveField(11)
  @JsonKey(name: "customer_address")
  String? customerAddress;
  @HiveField(12)
  List<ProductModel>? details;

  DataModel(
      {required this.status,
      required this.callBackReason,
      required this.cancellationReason,
      required this.postponedDate,
      required this.orderid,
      required this.commune,
      required this.noteToDriver,
      required this.totalPrice,
      required this.customerAddress,
      required this.customerName,
      required this.customerPhone,
      required this.customerPhone2,
      required this.details});
  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);

  static Future<DataModel?> get() async {
    var r = await _getDataModelDb();
    return r.values.firstOrNull;
  }

  static Future<Box<DataModel>> _getDataModelDb() async {
    return Hive.box<DataModel>('DataModel');
  }

  static Future<String> set(DataModel? data) async {
    if (data == null) return "User is empty";
    var r = await _getDataModelDb();
    await r.clear();
    await r.add(data);
    return "data saved succusfully";
  }

  static Future<void> updateDataModel({
    int? status,
    int? commune,
    int? callBackReason,
    int? cancellationReason,
    String? postponedDate,
    String? orderId,
    int? totalPrice,
    String? customerPhone,
    String? customerAddress,
    String? customerName,
    String? customerPhone2,
    String? noteToDriver,
    List<ProductModel>? details,
  }) async {
    var dataModel = await get() ??
        DataModel(
            status: null,
            callBackReason: null,
            cancellationReason: null,
            postponedDate: null,
            orderid: null,
            commune: null,
            customerAddress: null,
            details: null,
            customerName: null,
            customerPhone2: null,
            customerPhone: null,
            noteToDriver: null,
            totalPrice: null);
    if (details != null && details.isNotEmpty) {
      dataModel.details = details;
    }

    if (customerAddress != null) {
      dataModel.customerAddress = customerAddress;
    }
    if (noteToDriver != null) {
      dataModel.noteToDriver = noteToDriver;
    }

    if (customerName != null) {
      dataModel.customerName = customerName;
    }
    if (customerPhone != null) {
      dataModel.customerPhone = customerPhone;
    }
    if (customerPhone2 != null) {
      dataModel.customerPhone2 = customerPhone2;
    }
    if (totalPrice != null) {
      dataModel.totalPrice = totalPrice;
    }
    if (status != null) {
      dataModel.status = status;
    }
    if (callBackReason != null) {
      dataModel.callBackReason = callBackReason;
    }
    if (cancellationReason != null) {
      dataModel.cancellationReason = cancellationReason;
    }
    if (postponedDate != null) {
      dataModel.postponedDate = postponedDate;
    }
    if (orderId != null) {
      dataModel.orderid = orderId;
    }
    if (commune != null) {
      dataModel.commune = commune;
    }

    await set(dataModel);
  }

  static Future<void> clear() async {
    var r = await _getDataModelDb();
    await r.clear();
  }
}
