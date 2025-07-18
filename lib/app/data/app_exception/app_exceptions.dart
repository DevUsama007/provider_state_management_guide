class AppException implements Exception {
  final String message;
  final String? prefix;

  AppException({required this.message, this.prefix});

  @override
  String toString() {
    return "$prefix$message";
  }
}

class FetchDataException extends AppException {
  FetchDataException({required String message})
      : super(message: message, prefix: "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException({required String message})
      : super(message: message, prefix: "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException({required String message})
      : super(message: message, prefix: "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException({required String message})
      : super(message: message, prefix: "Invalid Input: ");
}

class NotFoundException extends AppException {
  NotFoundException({required String message})
      : super(message: message, prefix: "Not Found: ");
}

class TimeoutException extends AppException {
  TimeoutException({required String message})
      : super(message: message, prefix: "Timeout: ");
}

class ConflictException extends AppException {
  ConflictException({required String message})
      : super(message: message, prefix: "Conflict: ");
}

class InternalServerErrorException extends AppException {
  InternalServerErrorException({required String message})
      : super(message: message, prefix: "Internal Server Error: ");
}

class InternetException extends AppException {
  InternetException({required String message})
      : super(message: message, prefix: "Internet Exception: ");
}

class EmptyFieldException extends AppException {
  EmptyFieldException({required String message})
      : super(message: message, prefix: "Empty Field Exception: ");
}
