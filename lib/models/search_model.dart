import 'package:agent_confirmation/models/call_session.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_model.g.dart';

@JsonSerializable()
class SearchModel {
  int? count;
  String? next;
  int? previous;
  List<CallSessionModel?>? results;

  SearchModel({this.count, this.next, this.previous, this.results});

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}
