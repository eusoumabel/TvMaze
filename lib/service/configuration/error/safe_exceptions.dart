import 'package:dio/dio.dart';
import 'package:tv_maze/service/configuration/error/error_exceptions.dart';

class SafeExeptions {
  static Exception onError(dynamic error) {
    Exception exception = DefaultException(error.toString());
    if (error is Exception) {
      try {
        if (error is DioError) exception = _handleDioError(error);
      } on FormatException {
        exception = SafeFormatException();
      } catch (_) {
        throw exception;
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        exception = UnableToProcessException(error);
      }
    }
    throw exception;
  }

  static Exception _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return RequestCanceledException();
      case DioErrorType.connectTimeout:
        return ConnectTimeoutException();
      case DioErrorType.receiveTimeout:
        return RecieveTimeoutException();
      case DioErrorType.sendTimeout:
        return SendTimeoutException();
      case DioErrorType.other:
        return InternalServerErrorException();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case 400:
            return UnauthorizedException();
          case 401:
            return UnauthorizedException();
          case 403:
            return UnauthorizedException();
          case 404:
            return NotFoundException();
          case 409:
            return ConflictException();
          case 408:
            return RequestTimeoutException();
          case 500:
            return InternalServerErrorException();
          case 503:
            return ServiceUnavailableException();
          default:
            var responseCode = error.response?.statusCode;
            if (responseCode != null) {
              return DefaultNetworkException(statusCode: responseCode);
            } else {
              return InternalServerErrorException();
            }
        }
      default:
        return InternalServerErrorException();
    }
  }
}
