import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:agent_confirmation/converters/jiffy_converter.dart';

part 'search_object.g.dart';

@JiffyConverter()
@JsonSerializable()
@HiveType(typeId: 12)
class SearchObject extends HiveObject {
  @HiveField(0)
  int? searchKeyword;
  SearchObject({
    this.searchKeyword,
  });
  factory SearchObject.fromJson(Map<String, dynamic> json) =>
      _$SearchObjectFromJson(json);

  Map<String, dynamic> toJson() => _$SearchObjectToJson(this);
  static Future<Box<SearchObject>> _getSearchObjectDb() async {
    return await Hive.openBox<SearchObject>('SearchObject');
  }

  static Future<SearchObject?> get() async {
    var r = await _getSearchObjectDb();
    return r.values.first;
  }

  static Future<void> set(int? s) async {
    if (s == null) return;
    var r = await _getSearchObjectDb();
    await r.clear();
    await r.add(SearchObject(searchKeyword: s));
  }
}
