class ServerException implements Exception {}

class UnAuthorisedException implements Exception {}

class CacheException implements Exception {
  final String message;
  CacheException({required this.message});
}

class InternetException implements Exception {}

class ApiException implements Exception {
  final String message;

  ApiException({required this.message});
}
