class ServerException implements Exception {
  final String? message;
  final int? statusCode;

  const ServerException({this.message, this.statusCode});
}

class CacheException implements Exception {
  final String? message;

  const CacheException({this.message});
}

class NetworkException implements Exception {
  final String? message;

  const NetworkException({this.message});
}

class ValidationException implements Exception {
  final String? message;
  final Map<String, List<String>>? errors;

  const ValidationException({this.message, this.errors});
}

class UnauthorizedException implements Exception {
  final String? message;

  const UnauthorizedException({this.message});
}

class NotFoundException implements Exception {
  final String? message;

  const NotFoundException({this.message});
}

class ConflictException implements Exception {
  final String? message;

  const ConflictException({this.message});
}