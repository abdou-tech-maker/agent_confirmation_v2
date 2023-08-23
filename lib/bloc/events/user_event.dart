// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/product_model.dart';

part 'user_event.freezed.dart';

@freezed
abstract class UserEvent with _$UserEvent {
  const factory UserEvent.login(String username, String password) = Login;
  const factory UserEvent.commune(int wilayaId) = Commune;
  const factory UserEvent.wilaya() = Wilaya;
  const factory UserEvent.status({
    required String? id,
    required int? status,
    required int? cancellationReason,
    required int? callBackReason,
    required String? postponedDate,
    required int? commune,
    required int? totalPrice,
    required String? customerName,
    required String? customerPhone,
    required String? customerPhone2,
    required String? customerAddress,
    required String? deliveryNote,
    required List<ProductModel?>? details,
  }) = Status;
  const factory UserEvent.call() = Call;
  const factory UserEvent.profile() = Profile;
  const factory UserEvent.search(int searchKey) = Search;
  const factory UserEvent.product(String? id, String? name) = Product;
  const factory UserEvent.distract() = Distract;
}
