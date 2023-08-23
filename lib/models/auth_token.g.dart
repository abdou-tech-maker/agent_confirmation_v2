// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthTokenAdapter extends TypeAdapter<AuthToken> {
  @override
  final int typeId = 1;

  @override
  AuthToken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthToken(
      token: fields[0] as String?,
      dateAdded: fields[2] as Jiffy?,
      refreshToken: fields[3] as String?,
      expiresIn: fields[4] as Jiffy?,
      tokenType: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AuthToken obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(2)
      ..write(obj.dateAdded)
      ..writeByte(3)
      ..write(obj.refreshToken)
      ..writeByte(4)
      ..write(obj.expiresIn)
      ..writeByte(5)
      ..write(obj.tokenType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthTokenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthToken _$AuthTokenFromJson(Map<String, dynamic> json) => AuthToken(
      token: json['auth_token'] as String?,
      dateAdded: const JiffyConverter().fromJson(json['dateAdded'] as String?),
      refreshToken: json['refreshToken'] as String?,
      expiresIn: const JiffyConverter().fromJson(json['expiresIn'] as String?),
      tokenType: json['tokenType'] as String?,
    );

Map<String, dynamic> _$AuthTokenToJson(AuthToken instance) => <String, dynamic>{
      'auth_token': instance.token,
      'dateAdded': const JiffyConverter().toJson(instance.dateAdded),
      'refreshToken': instance.refreshToken,
      'expiresIn': const JiffyConverter().toJson(instance.expiresIn),
      'tokenType': instance.tokenType,
    };
