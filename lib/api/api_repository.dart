// ignore_for_file: non_constant_identifier_names, empty_catches

import 'dart:developer';

import 'package:agent_confirmation/api/api_client.dart';
import 'package:agent_confirmation/constantes/constantes.dart';
import 'package:agent_confirmation/models/call_session.dart';
import '../models/abortReasons_model.dart';
import '../models/callBackReason_model.dart';
import '../models/commune_model.dart';
import '../models/search_model.dart';
import '../models/product_model.dart';

import '../models/stats_model.dart';
import 'package:agent_confirmation/states/api_result.dart';
import 'package:agent_confirmation/states/network_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/wilaya_model.dart';

class ApiRepository {
  ApiClient? apiClient;

  ApiRepository() {
    var dio = Dio();
    apiClient = ApiClient(BASEURL, dio);
  }

  Future<ApiResult<Map<String, dynamic>>> login(
      String username, String password) async {
    try {
      dynamic response;

      response = await apiClient!.post("confirmation/staff/login/",
          data: {"username": username, "password": password});

      return ApiResult.success(data: response);
    } catch (e) {
      debugPrint("error when processing data response $e");
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<StatsModel?> getStats() async {
    try {
      Map<String, dynamic> response =
          await apiClient!.get("confirmation/confirmation_agents/me/");
      final stats = response["stats"];
      return StatsModel.fromJson(stats);
    } on DioError catch (e, stack) {
      debugPrint(
          "error when processing data response ${e.message}, stuck is $stack");
      return null;
    }
  }

  Future<ApiResult<CallSessionModel>?> getCallSession() async {
    try {
      dynamic response =
          await apiClient!.get("confirmation/orders_2b_confirmed/next/");

      final callSession = response;
      //  CallSessionModel call = CallSessionModel.fromJson(response!);
      // log("this the real call mpdel ${call.toJson()}");

      return ApiResult.success(data: CallSessionModel.fromJson(callSession!));
      /* dynamic response =
          await apiClient!.get("confirmation/orders_2b_confirmed/next/");

      if (response != null && response is String && response.isNotEmpty) {
        final callSession = CallSessionModel.fromJson(json.decode(response));
        return ApiResult.success(data: callSession);
      } else {
        // Handle empty response here
        return const ApiResult.success(
            data: null); // Return a success result with null data
      }*/
    } on DioError catch (e, stack) {
      debugPrint(
          "error when processing data response ${e.message}, stuck is $stack");
      return null;
    }
  }

  Future<ApiResult<CallSessionModel?>> changeStatus({
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
  }) async {
    try {
      Map<String, dynamic> data = {
        'status': status,
      };
      List<Map<String, dynamic>> detailsData = [];
      if (details != null && details.isNotEmpty) {
        detailsData = [];

        for (var product in details) {
          if (product != null) {
            Map<String, dynamic> productJson = {};

            if (product.id != null) {
              productJson['id'] = product.id;
            }
            if (product.logisticalDescription != null) {
              productJson['logistical_description'] =
                  product.logisticalDescription;
            }
            if (product.product != null) {
              productJson['product'] = product.product;
            }
            if (product.quantity != null) {
              productJson['quantity'] = product.quantity;
            }
            if (product.stockLevel != null) {
              productJson['low_stock_level'] = product.stockLevel;
            }

            if (productJson.isNotEmpty) {
              detailsData.add(productJson);
            }
          }
        }

        if (detailsData.isNotEmpty) {
          data['details'] = detailsData;
        }
      }

      /*   if (details != null && details.isNotEmpty) {
        detailsData = details.map((product) => product!.toJson()).toList();

        data['details'] = detailsData;
      }*/
      /*if (details != null && details.isNotEmpty) {
        detailsData = [];
        for (var product in details) {
          if (product != null) {
            Map<String, dynamic> productJson = product.toJson();
            Map<String, dynamic> nonNullFields = {};

            if (product.id != null) {
              nonNullFields['id'] = product.id;
            }
            if (product.logisticalDescription != null) {
              nonNullFields['logistical_description'] =
                  product.logisticalDescription;
            }
            if (product.product != null) {
              nonNullFields['product'] = product.product;
            }
            if (product.quantity != null) {
              nonNullFields['quantity'] = product.quantity;
            }
            if (product.stockLevel != null) {
              nonNullFields['low_stock_level'] = product.stockLevel;
            }

            if (nonNullFields.isNotEmpty) {
              productJson.addAll(nonNullFields);
              detailsData.add(productJson);
            }
          }
        }

        data['details'] = detailsData;
      }*/

      if (deliveryNote != null) {
        data['note_to_driver'] = deliveryNote;
      }
      if (customerAddress != "" && customerAddress != null) {
        data['customer_address'] = customerAddress;
      }
      if (customerPhone != "" && customerPhone != null) {
        data['customer_phone'] = customerPhone;
      }
      if (customerPhone2 != "" && customerPhone2 != null) {
        data['customer_phone_2'] = customerPhone2;
      }
      if (customerName != "" && customerName != null) {
        data['customer_name'] = customerName;
      }
      if (totalPrice != null) {
        data['total_price'] = totalPrice;
      }
      if (status == 20 && callBackReason != null) {
        data['callback_reason'] = callBackReason;
      } else if (status == 30 && postponedDate != null) {
        data['postponed_to'] = postponedDate;
      } else if (status == 100 && cancellationReason != null) {
        data['cancellation_reason'] = cancellationReason;
      } else if (status == 40 && commune != null) {
        data['commune'] = commune;
      }
      log('===========>  ${data.entries}');
      dynamic response = await apiClient!
          .patch("confirmation/orders_2b_confirmed/$id/", data: data);

      return ApiResult.success(data: CallSessionModel.fromJson(response));
    } on DioError catch (e, stack) {
      debugPrint(
          "error when processing data response ${e.message}, stuck is $stack");
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<List<WilayaModel>>> getWilayas() async {
    try {
      List<dynamic> response = await apiClient!.get("shared/wilayas/");

      return ApiResult.success(
          data: response.map((data) {
        int id = data[0];
        String name = data[1];
        return WilayaModel(id: id, name: name);
      }).toList());
    } on DioError catch (e, stack) {
      debugPrint(
          "error when processing data response ${e.message}, stuck is $stack");
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<List<CommuneModel>>> getCommunes(int wilaya) async {
    try {
      List<dynamic> response = await apiClient!
          .get("shared/communes/", queryParameters: {"wilaya": wilaya});

      return ApiResult.success(
          data: response
              .map((e) => CommuneModel.fromJson(e))
              .cast<CommuneModel>()
              .toList());
    } catch (e, stack) {
      debugPrint("error when processing data response $e, $stack");
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<List<CallBackReasonModel?>> getCallBackReasons() async {
    try {
      List<dynamic> response = await apiClient!.get("shared/callback_reasons/");

      List<CallBackReasonModel?> callBackReasons = response.map((data) {
        int id = data['id'];
        String name = data['name'];
        return CallBackReasonModel(id: id, name: name);
      }).toList();
      return callBackReasons;
    } on DioError catch (e, stack) {
      debugPrint(
          "error when processing data response ${e.message}, stuck is $stack");
      return [];
    }
  }

  Future<List<AbortReasonsModel?>> getAbortReasons() async {
    try {
      Map<String, dynamic> response =
          await apiClient!.get("shared/abort_reasons/");

      List<dynamic> abortReasonsList = response["list"];

      List<AbortReasonsModel?> abortReasons = abortReasonsList.map((data) {
        int id = data['id'];
        String name = data['name'];
        return AbortReasonsModel(id: id, name: name);
      }).toList();

      return abortReasons;
    } on DioError catch (e, stack) {
      debugPrint(
          "error when processing data response ${e.message}, stuck is $stack");
      return [];
    }
  }

  /*Future<int> getDeliveryPrice(
      int commmune, bool express, String version, int deliveryType) async {
    try {
      Map<String, dynamic> response = await apiClient2!
          .get("stores/orders/delivery_prices/", queryParameters: {
        "commune": commmune,
        "express": express,
        "version":version,
        "delivery_type":deliveryType
      });
    } catch (e, stack) {
      debugPrint(
          "error when processing data response ${e.toString()}, stuck is $stack");
    }
  }*/

  Future<ApiResult<SearchModel>> searchKeyword(
    int keyword,
  ) async {
    try {
      final statusValues = [30, 20, 100].join(',');

      dynamic response = await apiClient!
          .get("confirmation/orders_2b_confirmed/", queryParameters: {
        "customer_phone__icontains": keyword,
        "status__in": statusValues
      });
      return ApiResult.success(data: SearchModel.fromJson(response));
    } catch (e, stack) {
      debugPrint("error when processing data response $e, $stack");
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<List<ProductModel>>> getStoreProducts(
      String? id, String? name) async {
    try {
      List<dynamic> response = await apiClient!.get(
          "/confirmation/products/search/",
          queryParameters: {"store": id});

      return ApiResult.success(
          data: response
              .map((e) => ProductModel.fromJson(e))
              .cast<ProductModel>()
              .toList());
    } on DioError catch (e, stack) {
      debugPrint(
          "error when processing data response ${e.message}, stuck is $stack");
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<List<ProductModel?>> getProducts(String? id, String? name) async {
    try {
      List<dynamic> response = await apiClient!.get(
          "/confirmation/products/search/",
          queryParameters: {"store": id});

      return response
          .map((e) => ProductModel.fromJson(e))
          .cast<ProductModel>()
          .toList();
    } on DioError catch (e, stack) {
      debugPrint(
          "error when processing data response ${e.message}, stuck is $stack");
    }
    return [];
  }
}



  /*Future<List<FCMNotification>> getNotifications() async {
    try {
      List<dynamic> l = await apiClient!.get("notification/user/history");
      log("loggin fcm notifications $l");
      return l.map((e) => FCMNotification.fromJson(e)).cast<FCMNotification>().toList();
    } catch (e) {
      return [];
    }
  }

  /*
  Future<bool> updateFbToken(String? fireBaseKey) async {
    if (fireBaseKey == null) return false;
    try {
      await apiClient!.put("user", data: {
        'fireBaseKey': fireBaseKey,
      });
      return true;
    } catch (e) {
      return false;
    }
  }*/

  Future<bool> updateObject(String key, dynamic value) async {
    if (value == null) return false;
    try {
      await apiClient!.put("user", data: {
        key: value.id,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateString(String key, String? value) async {
    if (value == null) return false;
    try {
      await apiClient!.put("user", data: {
        key: value,
      });
      return true;
    } catch (e) {
      return false;
    }
  }
  
  */

