// ignore_for_file: must_be_immutable

import 'package:agent_confirmation/models/product_model.dart';
import 'package:agent_confirmation/models/store_model.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'call_session.g.dart';

@JsonSerializable()
@HiveType(typeId: 5)
class CallSessionModel extends Equatable {
  @HiveField(0)
  int? status;
  @HiveField(1)
  @JsonKey(name: "customer_name")
  String? customerName;
  @HiveField(2)
  @JsonKey(name: "customer_phone")
  String? customerPhone;
  @HiveField(3)
  @JsonKey(name: "customer_phone_2")
  String? customerPhone2;
  @HiveField(4)
  @JsonKey(name: "customer_address")
  String? customerAddress;
  @HiveField(5)
  @JsonKey(name: "upload_wilaya_name")
  String? uploadWilaya;
  @HiveField(6)
  @JsonKey(name: "upload_commune_name")
  String? uploadCommune;
  @HiveField(7)
  @JsonKey(name: "total_price")
  int? totalPrice;
  @HiveField(8)
  @JsonKey(name: "note_to_driver")
  String? noteToDriver;
  @HiveField(9)
  StoreModel? store;
  @HiveField(10)
  int? commune;
  @HiveField(11)
  int? wilaya;
  @HiveField(12)
  @JsonKey(name: "confirmed_at")
  String? cofirmedAt;
  @HiveField(13)
  @JsonKey(name: "postponed_to")
  String? postponedTo;
  @HiveField(14)
  @JsonKey(name: "cancelled_at")
  String? cancelledAt;
  @HiveField(15)
  @JsonKey(name: "cancellation_reason")
  int? cancellationReason;
  @HiveField(16)
  List<ProductModel>? details;
  @HiveField(17)
  @JsonKey(name: "callback_reason")
  int? callbackReason;
  @HiveField(18)
  @JsonKey(name: "display_id")
  int? displayId;
  @HiveField(19)
  String? id;

  CallSessionModel(
      {required this.status,
      required this.customerName,
      required this.customerPhone,
      required this.customerPhone2,
      required this.callbackReason,
      required this.cancellationReason,
      required this.cancelledAt,
      required this.cofirmedAt,
      required this.commune,
      required this.customerAddress,
      required this.details,
      required this.displayId,
      required this.noteToDriver,
      required this.postponedTo,
      required this.store,
      required this.totalPrice,
      required this.uploadCommune,
      required this.uploadWilaya,
      required this.wilaya,
      required this.id});

  factory CallSessionModel.fromJson(Map<String, dynamic> json) =>
      _$CallSessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CallSessionModelToJson(this);

  @override
  List<Object?> get props => [
        status,
        customerName,
        customerPhone,
        customerPhone2,
        callbackReason,
        cancellationReason,
        cancelledAt,
        cofirmedAt,
        commune,
        customerAddress,
        details,
        displayId,
        noteToDriver,
        postponedTo,
        store,
        totalPrice,
        uploadCommune,
        uploadWilaya,
        wilaya,
        id
      ];

  // CallSessionModel copyWith({required String field1}) {}
}
