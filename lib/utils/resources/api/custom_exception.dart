class CustomException implements Exception {
  final String message;
  final int? statusCode;

  CustomException({required this.message, this.statusCode});

  CustomException.networkError({
    this.message = 'Network error, please check your internet connection',
    this.statusCode,
  });

  CustomException.networkTimeout({
    this.message = 'Network timeout',
    this.statusCode,
  });

  @override
  String toString() {
    return message;
  }
}
