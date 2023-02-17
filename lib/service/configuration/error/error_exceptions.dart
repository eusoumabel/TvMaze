class BadRequestException implements Exception {
  BadRequestException() : super();

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException implements Exception {
  InternalServerErrorException() : super();

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException implements Exception {
  ConflictException() : super();

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException implements Exception {
  UnauthorizedException() : super();

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException implements Exception {
  NotFoundException() : super();

  @override
  String toString() {
    return 'The information could not be found';
  }
}

class NoInternetConnectionException implements Exception {
  NoInternetConnectionException() : super();

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException implements Exception {
  DeadlineExceededException() : super();

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}

class RequestCanceledException implements Exception {
  RequestCanceledException() : super();

  @override
  String toString() {
    return 'The request was cancelled.';
  }
}

class ConnectTimeoutException implements Exception {
  ConnectTimeoutException() : super();

  @override
  String toString() {
    return 'The request was taking too long.';
  }
}

class RecieveTimeoutException implements Exception {
  RecieveTimeoutException() : super();

  @override
  String toString() {
    return 'The response was taking too long.';
  }
}

class RequestTimeoutException implements Exception {
  RequestTimeoutException() : super();

  @override
  String toString() {
    return 'The request was taking too long.';
  }
}

class ServiceUnavailableException implements Exception {
  ServiceUnavailableException() : super();

  @override
  String toString() {
    return 'The service is unavailable.';
  }
}

class DefaultNetworkException implements Exception {
  final int statusCode;
  DefaultNetworkException({
    required this.statusCode,
  }) : super();

  @override
  String toString() {
    return 'Invalid status code: $statusCode';
  }
}

class SendTimeoutException implements Exception {
  SendTimeoutException() : super();

  @override
  String toString() {
    return 'The request was taking to long.';
  }
}

class SafeFormatException extends FormatException {
  SafeFormatException() : super();

  @override
  String toString() {
    return 'A FormatException has occurred.';
  }
}

class UnableToProcessException implements Exception {
  final String error;
  UnableToProcessException(this.error) : super();

  @override
  String toString() {
    return 'The action were unable to be processed: $error';
  }
}

class DefaultException implements Exception {
  final String error;
  DefaultException(this.error) : super();

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.\n$error';
  }
}

class GetTokenException implements Exception {
  GetTokenException() : super();

  @override
  String toString() {
    return 'Your token expired, please login again.';
  }
}
