// ignore_for_file: non_constant_identifier_names, sdk_version_since

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stats_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class StatsModel {
  @HiveField(0)
  @JsonKey(name: 'orders_pending')
  int? pendingOrders;
  @HiveField(1)
  @JsonKey(name: 'orders_callback')
  int? ordersCallback;
  @HiveField(2)
  @JsonKey(name: 'orders_postponed_to_today')
  int? ordersPostponed;
  @HiveField(3)
  @JsonKey(name: 'orders_2b_confirmed')
  int? orderToBeConfirmed;
  @HiveField(4)
  @JsonKey(name: 'orders_confirmed_today')
  int? ordersConfirmed;
  @HiveField(5)
  @JsonKey(name: 'orders_cancelled_today')
  int? ordersCancelled;

  StatsModel(
      {this.pendingOrders,
      this.ordersCallback,
      this.ordersPostponed,
      this.orderToBeConfirmed,
      this.ordersConfirmed,
      this.ordersCancelled});

  static Future<Box<StatsModel>> _getStatsModelDb() async {
    return Hive.box<StatsModel>('StatsModel');
  }

  static Future<StatsModel?> get() async {
    var r = await _getStatsModelDb();
    return r.values.firstOrNull;
  }

  static Future<String> set(StatsModel? user) async {
    if (user == null) return "stats are empty";
    var r = await _getStatsModelDb();
    await r.clear();
    await r.add(user);
    return "stats saved succusfully";
  }

  static Future<void> clear() async {
    var r = await _getStatsModelDb();
    await r.clear();
  }

  factory StatsModel.fromJson(Map<String, dynamic> json) =>
      _$StatsModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatsModelToJson(this);
}
