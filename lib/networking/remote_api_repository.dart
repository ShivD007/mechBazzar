import 'dart:async';

import 'package:dartz/dartz.dart';

import '../core/models/failure_model.dart';

abstract class RemoteApiRepository {
  RemoteApiRepository();

  Future<Either<FailureModel, dynamic>> getApiRequest(
      String endpoint, Map<String, dynamic> headers, String authToken,
      {Map<String, dynamic>? params});
}
