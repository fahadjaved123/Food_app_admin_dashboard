class AppException implements Exception {
  final message;
  final prefix;
  AppException([this.message, this.prefix]);
  String tostring() {
    return '$message';
  }
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message, 'No Internet');
}

class RequestTimeout extends AppException {
  RequestTimeout([String? message]) : super(message, 'Request Time Out');
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, 'Server net error');
}

class InvalidaUrl extends AppException {
  InvalidaUrl([String? message]) : super(message, 'Invalida Url');
}

class FetchdataException extends AppException {
  FetchdataException([String? message])
      : super(message, 'error while communicating the server');
}
