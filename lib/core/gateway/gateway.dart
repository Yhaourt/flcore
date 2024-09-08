import 'package:flcore/core/api/api.dart';
import 'package:flcore/core/interfaces/api/call.dart';
import 'package:flcore/core/api/method.dart';
import 'package:flcore/core/api/status_code_handler.dart';

abstract class Gateway implements ICall {
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
    bool useEndpoint = true,
    required Method method,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    List<StatusCodeHandler> statusCodeHandlers = const [],
  }) async {
    return _api.call(
      path: (useEndpoint) ? _getFullPath(path) : path,
      method: method,
      params: params,
      body: body,
      headers: headers,
      statusCodeHandlers: statusCodeHandlers,
    );
  }

  String _getFullPath(String? path) => '${_endpoint ?? ''}${path ?? ''}';
}
