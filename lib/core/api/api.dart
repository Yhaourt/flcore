import 'package:dio/dio.dart';
import 'package:flcore/core/api/i_call.dart';
import 'package:flcore/core/api/method.dart';
import 'package:flcore/core/api/status_code_handler.dart';
import 'package:flcore/core/exceptions/exceptions.dart';
import 'package:flcore/utils/helpers/logger_helper.dart';

class Api implements ICall {
  Api({
    required String baseUrl,
    this.headers = const {},
    this.shouldEnableLogs = false,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        validateStatus: (status) => true,
        headers: headers,
      ),
    );

    if (shouldEnableLogs) enableLogs();
  }

  late final Dio _dio;
  late Map<String, String> headers;
  final bool shouldEnableLogs;

  @override
  Future<dynamic> call({
    String? path,
    required Method method,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    List<StatusCodeHandler> statusCodeHandlers = const [],
  }) async {
    try {
      final Response<dynamic> response = await _dio.request(
        path ?? '',
        queryParameters: params,
        data: body,
        options: Options(
          method: methodToString(method),
          headers: headers,
        ),
      );

      for (final handler in statusCodeHandlers) {
        handler.handle(response);
      }

      return response.data;
    } on DioException catch (e) {
      logger.e(e);
      switch (e.type) {
        case DioExceptionType.connectionError:
        case DioExceptionType.connectionTimeout:
          throw InternalServerException();
        default:
          throw UnknownException();
      }
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  void addHeader(String key, String value) {
    headers[key] = value;
  }

  void addHeaders(Map<String, String> headers) {
    this.headers.addAll(headers);
  }

  void removeHeader(String key) {
    headers.remove(key);
  }

  void removeHeaders(List<String> keys) {
    keys.forEach((key) => headers.remove(key));
  }

  void enableLogs() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          logger.i({
            'url': options.uri,
            'method': options.method,
            'body': options.data,
            'params': options.queryParameters,
          });
          handler.next(options);
        },
        onResponse: (response, handler) {
          logger.i({
            'statusCode': response.statusCode,
            'body': response.data,
          });
          handler.next(response);
        },
      ),
    );
  }
}
