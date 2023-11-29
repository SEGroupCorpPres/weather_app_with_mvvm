class AppExceptions implements Exception {
  final String? _prefix;
  final String? _message;

  AppExceptions([this._prefix, this._message]);

  @override
  String toString() {
    // TODO: implement toString
    return '$_prefix$_message';
  }
}

class NetworkExceptions extends AppExceptions {
  NetworkExceptions([String? message]) : super(message, 'Network Error Issues');
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]) : super(message, 'The request has timed out');
}

class ServerError extends AppExceptions {
  ServerError([String? message]) : super(message, 'An internal server error occurred');
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message]) : super(message, 'The URL provided is invalid');
}

class FetchDataExceptions extends AppExceptions {
  FetchDataExceptions([String? message]) : super(message, 'Failed to fetch data from the server');
}
