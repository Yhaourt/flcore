import 'package:flcore/core/api/api.dart';
import 'package:flcore/core/api/call_i.dart';
import 'package:flcore/core/api/method.dart';
import 'package:flcore/core/api/status_code_handler.dart';

abstract class Gateway implements CallI {
  Gateway({
    required Api api,
    String? endpoint,
  }) {
    _api = api;
    _endpoint = endpoint;
  }

  late final Api _api;
  late final String? _endpoint;

  @override
  Future<dynamic> call({
    String? path,
    required Method method,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    List<StatusCodeHandler> statusCodeHandlers = const [],
  }) async {
    return _api.call(
      path: _getCallPath(path),
      method: method,
      params: params,
      body: body,
      headers: headers,
      statusCodeHandlers: statusCodeHandlers,
    );
  }

  String _getCallPath(String? path) => '${_endpoint ?? ''}${path ?? ''}';
}
