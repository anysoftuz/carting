class ServerException implements Exception {
  final String errorMessage;
  final num statusCode;
  const ServerException({required this.statusCode, required this.errorMessage});

  @override
  String toString() {
    return 'ServerException(statusCode: $statusCode, errorMessage: $errorMessage)';
  }
}

class DioExceptions implements Exception {}
