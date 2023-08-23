// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchObjectAdapter extends TypeAdapter<SearchObject> {
  @override
  final int typeId = 12;

  @override
  SearchObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchObject(
      searchKeyword: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, SearchObject obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.searchKeyword);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchObject _$SearchObjectFromJson(Map<String, dynamic> json) => SearchObject(
      searchKeyword: json['searchKeyword'] as int?,
    );

Map<String, dynamic> _$SearchObjectToJson(SearchObject instance) =>
    <String, dynamic>{
      'searchKeyword': instance.searchKeyword,
    };
