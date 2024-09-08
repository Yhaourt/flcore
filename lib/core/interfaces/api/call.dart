import 'package:flcore/core/api/method.dart';
import 'package:flcore/core/api/status_code_handler.dart';

abstract class ICall {
  Future<dynamic> call({
    String? path,
    required Method method,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    List<StatusCodeHandler> statusCodeHandlers = const [],
  });
}
