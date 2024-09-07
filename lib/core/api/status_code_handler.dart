import 'package:dio/dio.dart';
import 'package:flcore/exceptions/http_exceptions.dart';

class StatusCodeHandler {
  const StatusCodeHandler({
    required this.statusCode,
    required this.callback,
  });

  final int statusCode;
  final void Function() callback;

  void handle(Response<dynamic> response) {
    if (response.statusCode == statusCode) {
      callback();
    }
  }
}

class Handle401 extends StatusCodeHandler {
  Handle401()
      : super(
          statusCode: 401,
          callback: () {
            throw UnauthorizedException();
          },
        );
}

class Handle404 extends StatusCodeHandler {
  Handle404()
      : super(
          statusCode: 404,
          callback: () {
            throw NotFoundException();
          },
        );
}

class Handle500 extends StatusCodeHandler {
  Handle500()
      : super(
          statusCode: 500,
          callback: () {
            throw InternalServerException();
          },
        );
}
