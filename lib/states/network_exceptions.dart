// ignore_for_file: depend_on_referenced_packages, unused_catch_clause

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@freezed
abstract class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.unprocessableEntity(dynamic message) =
      UnprocessableEntity;

  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorisedRequest(dynamic reason) =
      UnauthorisedRequest;

  const factory NetworkExceptions.paymentRequired() = PaymentRequired;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.rangeNotSatisfiable() = RangeNotSatisfiable;

  const factory NetworkExceptions.offlineEntity() = OfflineEntity;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  const factory NetworkExceptions.sellersLimitReached() = SellersLimitReached;

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              networkExceptions = const NetworkExceptions.requestCancelled();
              break;
            case DioErrorType.connectTimeout:
              networkExceptions = const NetworkExceptions.requestTimeout();
              break;
            case DioErrorType.other:
              networkExceptions =
                  const NetworkExceptions.noInternetConnection();
              break;
            case DioErrorType.receiveTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioErrorType.response:
              switch (error.response!.statusCode) {
                case 400:
                  networkExceptions = NetworkExceptions.unauthorisedRequest(
                      error.response!.statusMessage);
                  break;
                case 401:
                  networkExceptions = NetworkExceptions.unauthorisedRequest(
                      error.response!.statusMessage);
                  break;
                case 402:
                  networkExceptions = const NetworkExceptions.paymentRequired();
                  break;
                case 403:
                  debugPrint("unauthorized request message ${error.response}");
                  networkExceptions = NetworkExceptions.unauthorisedRequest(
                      error.response.toString());
                  break;
                case 404:
                  networkExceptions =
                      const NetworkExceptions.notFound("Not found");
                  break;
                case 409:
                  networkExceptions = const NetworkExceptions.conflict();
                  break;
                case 408:
                  networkExceptions = const NetworkExceptions.requestTimeout();
                  break;
                case 416:
                  networkExceptions =
                      const NetworkExceptions.rangeNotSatisfiable();
                  break;
                case 415:
                  networkExceptions = const NetworkExceptions.offlineEntity();
                  break;
                case 422:
                  networkExceptions =
                      NetworkExceptions.unprocessableEntity(error);
                  break;
                case 429:
                  networkExceptions =
                      const NetworkExceptions.sellersLimitReached();
                  break;
                case 500:
                  networkExceptions =
                      const NetworkExceptions.internalServerError();
                  break;
                case 503:
                  networkExceptions =
                      const NetworkExceptions.serviceUnavailable();
                  break;
                default:
                  var responseCode = error.response!.statusCode;
                  networkExceptions = NetworkExceptions.defaultError(
                    "Received invalid status code: $responseCode",
                  );
              }
              break;
            case DioErrorType.sendTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          log("unexpected error message is $error");
          /*if (error.toString().isNotEmpty) {
            Exception e = error;
            log("unexpected error message is string $e");
            networkExceptions = NetworkExceptions.notFound(e.toString());
          } else {*/
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (e) {
        // Helper.printError(e.toString())
        return const NetworkExceptions.formatException();
      } catch (m) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = "";
    networkExceptions.when(
      notImplemented: () {
        errorMessage = "Not Implemented";
      },
      requestCancelled: () {
        errorMessage = "Request Cancelled";
      },
      internalServerError: () {
        errorMessage = "Internal Server Error";
      },
      notFound: (String reason) {
        errorMessage = reason;
      },
      serviceUnavailable: () {
        errorMessage = "Service unavailable";
      },
      methodNotAllowed: () {
        errorMessage = "Method Allowed";
      },
      badRequest: () {
        errorMessage = "Bad request";
      },
      unauthorisedRequest: (dynamic reason) {
        if (reason != null) {
          errorMessage = reason;
        } else {
          errorMessage = "Unauthorised request";
        }
      },
      unexpectedError: () {
        errorMessage = "Unexpected error occurred";
      },
      requestTimeout: () {
        errorMessage = "Connection request timeout";
      },
      rangeNotSatisfiable: () {
        errorMessage = "service doesn't allow multiple appointments";
      },
      noInternetConnection: () {
        errorMessage = "No internet connection";
      },
      conflict: () {
        errorMessage = "Error due to a conflict";
      },
      sendTimeout: () {
        errorMessage = "Send timeout in connection with API server";
      },
      unableToProcess: () {
        errorMessage = "Unable to process the data";
      },
      defaultError: (String error) {
        errorMessage = error;
      },
      formatException: () {
        errorMessage = "Unexpected error occurred";
      },
      notAcceptable: () {
        errorMessage = "Not acceptable";
      },
      offlineEntity: () {
        errorMessage = "Requested target is offline";
      },
      sellersLimitReached: () {
        errorMessage =
            "Sellers limit reached, please contact the administration.";
      },
      unprocessableEntity: (dynamic error) {
        errorMessage = "";
        if (error != null) {
          ErrorMessage em = ErrorMessage.fromJson(error.response.data);
          errorMessage =
              em.toStringErrors(); //error.response.data['errors'].toString();
          debugPrint("error result ${error.response.data['errors']}");
          debugPrint("error result ${em.toStringErrors()}");
        }
        //error.response.data['message'];
      },
      paymentRequired: () {
        errorMessage = "Payment required, please contact administration";
      },
    );
    return errorMessage;
  }
}

class ErrorTypes {
  List<String>? email;
  List<String>? password;
}

class ErrorMessage {
  String? message;
  List<String>? email;
  List<String>? password;
  List<String>? name, address, specialities, serviceName;

  ErrorMessage.fromJson(json) {
    if (json != null) {
      if (json['message'] != null) {
        message = json['message'];
      }
      if (json['errors'] != null) {
        if (json['errors']['email'] != null) {
          email = List<String>.from(json['errors']['email']);
        }
        if (json['errors']['password'] != null) {
          password = List<String>.from(json['errors']['password']);
        }
        if (json['errors']['name'] != null) {
          name = List<String>.from(json['errors']['name']);
        }
        if (json['errors']['address'] != null) {
          address = List<String>.from(json['errors']['address']);
        }
        if (json['errors']['specialities'] != null) {
          specialities = List<String>.from(json['errors']['specialities']);
        }
        if (json['errors']['service_name'] != null) {
          serviceName = List<String>.from(json['errors']['service_name']);
        }
      }
      log('error insside, $message, $name, $email, $password, $json');
    }
  }

  String toStringErrors() {
    String emails = "";
    String pass = "";
    String names = "";
    var addr = "", spec = "", sName = "";
    if (email != null) emails = "${email!.join("\n")}\n";
    if (password != null) pass = "${password!.join("\n")}\n";
    if (address != null) addr = "${address!.join("\n")}\n";
    if (specialities != null) spec = "${specialities!.join("\n")}\n";
    if (serviceName != null) sName = "${serviceName!.join("\n")}\n";
    if (name != null) names = name!.join("\n");
    return emails + pass + names + addr + spec + sName;
  }
}
