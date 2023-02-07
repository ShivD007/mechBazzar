import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../core/constants/url_constants.dart';
import 'app_exception.dart';

class BaseApiCallHelper {
  static final String _baseUrl = AppUrls.baseUrl;

  static Map<String, String> getHeaders() {
    Map<String, String> _header = {
      'Content-Type': 'application/json',
    };
    return _header;
  }

  static Future<dynamic> get(String url, {Map<String, dynamic>? header}) async {
    Map<String, String> _tempHeader = {...getHeaders(), ...header ?? {}};

    var responseJson;
    try {
      final response = await http.get(Uri.parse(_baseUrl + url), headers: _tempHeader);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  static Future<dynamic> post(
    String url,
    Object? body, {
    Map<String, dynamic>? header,
  }) async {
    Map<String, String> _tempHeader = {...getHeaders(), ...header ?? {}};
    var responseJson;
    try {
      final response = await http.post(Uri.parse(_baseUrl + url), body: jsonEncode(body), headers: _tempHeader);
      responseJson = _returnResponse(
        response,
      );
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  static Future<dynamic> put(
    String url,
    Object? body,
  ) async {
    var responseJson;

    try {
      final response = await http.put(Uri.parse(_baseUrl + url), body: jsonEncode(body), headers: getHeaders());

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  static Future<dynamic> delete(String url, Object? body) async {
    var responseJson;
    try {
      final response = await http.delete(Uri.parse(_baseUrl + url), body: jsonEncode(body), headers: {});
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  static dynamic _returnResponse(http.Response response) {
    if (jsonDecode(response.body)["errorCode"] == "1") {
      throw BadRequestException(jsonDecode(response.body)["errorMsg"]);
    }

    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);

        return responseJson;
      case 400:
      case 406:
        throw BadRequestException(jsonDecode(response.body)["errorMsg"]);
      case 401:
        throw UnauthorisedException(jsonDecode(response.body)["errorMsg"]);
      case 403:
        throw UnauthorisedException(jsonDecode(response.body)["errorMsg"]);

      case 404:
        throw NotFoundException(jsonDecode(response.body)["errorMsg"]);
      case 408:
        throw LimitExceededException(jsonDecode(response.body)["errorMsg"]);
      case 500:
      default:
        throw FetchDataException('${response.statusCode}: ${jsonDecode(response.body)["errorMsg"]}');
    }
  }
}
