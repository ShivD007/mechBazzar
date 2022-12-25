import 'dart:async';
import 'dart:io';
import 'package:admin_jandhara/networking/remote_api_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../core/constants/string_constants.dart';
import '../core/models/failure_model.dart';
import 'network_info.dart';

class RemoteApiRepositoryImpl implements RemoteApiRepository {
  static String baseUrl = "https://www.jandhara24.com/wp-json";

  Dio dio;
  NetworkInfo networkInfo;

  RemoteApiRepositoryImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<FailureModel, dynamic>> getApiRequest(
      String endpoint, Map<String, dynamic> headers, String authToken,
      {Map<String, dynamic>? params}) async {
    try {
      if (!await networkInfo.isConnected) {
        return Left(
            FailureModel(errorMessage: INTERNET_CONNECTION, statusCode: null));
      }
      dio.options.headers['content-Type'] = 'application/json';

      print(" $baseUrl$endpoint $authToken");
      Response response = await dio.get(baseUrl + endpoint,
          options: Options(headers: headers),
          queryParameters: params ?? <String, dynamic>{});

      if (response.statusCode != 200) {
        return Left(FailureModel(
            errorMessage: response.data["message"] ?? "Something Went Wrong",
            statusCode: null));
      } else {
        return Right(response.data);
      }
    } on DioError catch (e) {
      String statusMessage = "";

      print("Message :: " + e.message.toString());
      print("Error :: " + e.toString());
      int statusCode = 0;
      if (e.response != null) {
        statusCode = e.response!.statusCode!;
        if (statusCode == 500) {
          return Left(
              FailureModel(errorMessage: SERVER_EXCEPTION, statusCode: null));
        }
        if (statusCode >= 400 && statusCode <= 402) {
          return Left(
              FailureModel(errorMessage: USER_UNAUTHORISED, statusCode: null));
        }
      } else {
        if (e.error is SocketException) {
          return Left(FailureModel(
              errorMessage: INTERNET_CONNECTION, statusCode: null));
        }
      }
      return Left(FailureModel(errorMessage: e.message, statusCode: null));
    } on TimeoutException {
      return Left(FailureModel(errorMessage: TIME_OUT_ERROR, statusCode: null));
    } on HttpException {
      return Left(
          FailureModel(errorMessage: INTERNET_CONNECTION, statusCode: null));
    } catch (e) {
      return Left(FailureModel(errorMessage: e.toString(), statusCode: null));
    }
  }
}
