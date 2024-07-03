import 'package:dio/dio.dart';
import 'dart:io'; // Import for SocketException

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  const ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection timeout');
      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send timeout');
      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Receive timeout');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response?.statusCode ?? 0,
          dioException.response?.data,
        );
      case DioExceptionType.cancel:
        return const ServerFailure('Request cancelled');
      case DioExceptionType.connectionError:
        return const ServerFailure('Connection error');
      case DioExceptionType.unknown:
      default:
        if (dioException.error is SocketException) {
          return ServerFailure.fromSocketException(
              dioException.error as SocketException);
        } else {
          return const ServerFailure('Unknown error');
        }
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
          response?['error']?['message'] ?? 'Authorization error');
    } else if (statusCode == 404) {
      return const ServerFailure(
          'Your request not found, please try again later');
    } else if (statusCode == 500) {
      return const ServerFailure(
          'Internal server error, please try again later');
    } else {
      return const ServerFailure('Unknown error');
    }
  }

  factory ServerFailure.fromSocketException(SocketException socketException) {
    return const ServerFailure('No internet connection');
  }
}
