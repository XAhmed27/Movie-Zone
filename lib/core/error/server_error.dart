import 'package:dio/dio.dart';

import 'my_error.dart';

class ServerError extends MyError {
  ServerError({required super.message});

  factory ServerError.fromDio(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerError(message: "Connection error");

      case DioExceptionType.sendTimeout:
        return ServerError(message: "Send timeout error");

      case DioExceptionType.connectionError:
        return ServerError(message: "No Internet Connection");

      default:
        return ServerError(message: "Something went wrong");
    }
  }

  factory ServerError.fromException(Exception e) {
    return ServerError(message: e.toString());
  }
}
