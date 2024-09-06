import 'package:flcore/core/api/api.dart';
import 'package:flcore/core/api/method.dart';

abstract class Gateway {
  Gateway({
    required Api api,
    String? endpoint,
  }) {
    _api = api;
    _endpoint = endpoint;
  }

  late final Api _api;
  late final String? _endpoint;

  Future<dynamic> call({
    String? path,
    required Method method,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    Map<int, Function> statusCodeHandlers = const {},
  }) async {
    return _api.call(
      path: '$_endpoint$path',
      method: method,
      params: params,
      body: body,
      headers: headers,
      statusCodeHandlers: statusCodeHandlers,
    );
  }
}
