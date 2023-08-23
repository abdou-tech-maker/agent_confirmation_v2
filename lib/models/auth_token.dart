import 'dart:developer';

import 'package:agent_confirmation/converters/jiffy_converter.dart';
import 'package:agent_confirmation/models/user_model.dart';

import 'package:hive/hive.dart';
import 'package:jiffy/jiffy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_token.g.dart';

@JsonSerializable()
@JiffyConverter()
@HiveType(typeId: 1)
class AuthToken extends HiveObject {
  @HiveField(0)
  @JsonKey(name: 'auth_token')
  String? token;
  @HiveField(2)
  Jiffy? dateAdded;
  @HiveField(3)
  String? refreshToken;
  @HiveField(4)
  Jiffy? expiresIn;
  @HiveField(5)
  String? tokenType;

  AuthToken({
    required this.token,
    required this.dateAdded,
    required this.refreshToken,
    required this.expiresIn,
    required this.tokenType,
  });

  factory AuthToken.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenToJson(this);

  static Future<Box<AuthToken>> _getAuthTokenDb() async {
    return await Hive.openBox<AuthToken>('AuthToken');
  }

  static Future<AuthToken?> get() async {
    var r = await _getAuthTokenDb();
    AuthToken? auth;
    if (r.isNotEmpty) auth = r.getAt(0);

    return auth;
  }

  static Future<String?> getToken() async {
    AuthToken? auth = await AuthToken.get();
    return auth?.token;
  }

  /*static Future<String?> getRefreshToken() async {
    AuthToken? auth = await AuthToken.get();
    return auth?.refreshToken;
  }*/

  static Future<bool> hasToken() async {
    AuthToken? auth = await AuthToken.get();
    if (auth != null) return auth.token != '' && auth.token != null;
    return false;
  }

  static Future<void> setToken(String token, String refreshToken, int expiredIn,
      String tokenType) async {
    var r = await _getAuthTokenDb();
    final exp = Jiffy().add(seconds: expiredIn);

    log("expires in ${exp.dateTime.toIso8601String()}");
    AuthToken? auth;
    if (r.isEmpty) {
      auth = AuthToken(
          token: token,
          refreshToken: refreshToken,
          tokenType: tokenType,
          expiresIn: exp,
          dateAdded: Jiffy());
      await r.put(0, auth);
    } else {
      auth = r.getAt(0);
      if (auth != null) {
        auth.token = token;
        auth.refreshToken = refreshToken;
        auth.tokenType = tokenType;
        auth.expiresIn = exp;
        await auth.save();
      }
    }
  }

  static Future<bool> setTokenWithoutRefresh(
      String token, int expiredIn, String tokenType) async {
    var r = await _getAuthTokenDb();
    final exp = Jiffy().add(seconds: expiredIn);

    log("expires in ${exp.dateTime.toIso8601String()}");
    AuthToken? auth;
    if (r.isEmpty) return false;
    auth = r.getAt(0);
    if (auth != null) {
      auth.token = token;
      auth.tokenType = tokenType;
      auth.expiresIn = exp;
      await auth.save();
    }
    return true;
  }

  static Future<void> clearAll() async {
    var r = await _getAuthTokenDb();
    await r.clear();
  }

  static Future<bool> isLogged() async {
    bool r = (await AuthToken.get() != null) && (await UserModel.get() != null);
    /*if (r) {
      await BackChannel().startGeoLocator();
       await FCMNotification.loadFromApi();
    }*/
    return r;
  }
}
