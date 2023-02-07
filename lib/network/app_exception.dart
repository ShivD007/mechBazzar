import 'package:flutter/foundation.dart';

class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]) {
   
  }
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, "");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "");
}

class LimitExceededException extends AppException {
  LimitExceededException([String? message]) : super(message, "");
}

class NotFoundException extends AppException {
  NotFoundException([String? message]) : super(message, "");
}
