// ignore_for_file: unused_element

import 'dart:developer';
import 'dart:io';

import 'package:agent_confirmation/Helpers/common.dart';
import 'package:agent_confirmation/main.dart';
import 'package:agent_confirmation/models/auth_token.dart';
import 'package:agent_confirmation/pages/Login/loginPage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute;

class ApiClient {
  final String baseUrl;
  Dio? _dio;
  final List<Interceptor>? interceptors;

  Future<void> _loginUser() async {
    await clearUser();
    navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
      builder: (context) => const Login(),
    ));
  }

  Future<RequestOptions> requestInterceptor(RequestOptions options) async {
    String? token = await AuthToken.getToken();
    if (token != null) {
      debugPrint("api key = $token");
      connectAndListen(token);
      options.headers['Authorization'] = "token $token";
    }

    //options.headers.addAll({"Token": "$token${DateTime.now()}"});

    return options;
  }

  bool _isValidRefreshToken(DioError error) {
    log("error response data checking id is map");
    if (error.response?.data is! Map) return true;
    Map<String, dynamic>? r = error.response?.data;
    log("error response data is $r");
    if (r?.containsKey("error") == true) {
      if (r?["error"] == "invalid_request") return false;
    }
    return true;
  }

  /*Future<void> refreshToken(DioError error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == 401) {
      if (_isValidRefreshToken(error)) {
        String? t = await AuthToken.getRefreshToken();
        if (t != null) {
          log("posting refresh token = $t");
          ApiRepository api = ApiRepository();
          final response = await api.refreshToken(t);
          log("result response is ${response.toString()}");
          if (await AuthToken.setTokenWithoutRefresh(response['access_token'], response['expires_in'], response['token_type'])) {
            final cloneReq = await _retry(error.requestOptions);
            handler.resolve(cloneReq);
          } else {
            await _loginUser();
            handler.reject(error);
          }
        } else {
          await _loginUser();
          handler.reject(error);
        }
      } else {
        await _loginUser();
        handler.reject(error);
      }
    } else {
      handler.reject(error);
    }
  }*/

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio!.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  ApiClient(this.baseUrl, Dio? dio, {this.interceptors}) {
    _dio = dio ?? Dio();
    _dio!
      ..options.baseUrl = baseUrl
      //..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": '*',
        "Access-Control-Allow-Headers": "*",
        "Access-Control-Allow-Methods": "*",
      };
    _dio!.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        RequestOptions r = await requestInterceptor(options);
        log("request options ${r.baseUrl}");
        return handler.next(r);
      },
      onError: (error, handler) async {
        log("error token $error");
        handler.reject(error);
        //await refreshToken(error, handler);
      },
    ));
    if (interceptors != null) {
      if (interceptors!.isNotEmpty) {
        _dio!.interceptors.addAll(interceptors!);
      }
    }
    //if (kDebugMode) {
    _dio!.interceptors.add(LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: false,
        responseHeader: false,
        request: false,
        requestBody: false));
    //}
  }

  Future<dynamic>? get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio!.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      debugPrint('socket error $e');
      rethrow; //SocketException(e.toString());
    } on FormatException catch (_) {
      debugPrint('format exception, $_');
      throw const FormatException("Unable to process the data");
    } on DioError catch (dio, stackTrace) {
      /*if (dio.type == DioErrorType.connectTimeout) {
        throw Exception("Connection timeout, please check your internet connection");
      }*/
      debugPrint('dio error ${dio.response}');
      debugPrint('dio error stack trace$stackTrace');
      rethrow;
    } catch (e) {
      //print('not DIO Error ' + _dio!.options.baseUrl + uri);
      rethrow;
    }
  }

  Future<dynamic> post(
    String? uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio?.post(
        uri!,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response?.data; //.data
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } on DioError catch (e) {
      debugPrint("dio error when posting data response $e");
      rethrow;
    } catch (e) {
      debugPrint("error when posting data response ${e.toString()}");
      rethrow;
    }
  }

  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio?.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response?.data;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> patch(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio?.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response?.data;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio?.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response?.data;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
