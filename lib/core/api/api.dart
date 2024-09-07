import 'package:dio/dio.dart';
import 'package:flcore/core/api/i_call.dart';
import 'package:flcore/core/api/method.dart';
import 'package:flcore/core/api/status_code_handler.dart';
import 'package:flcore/core/exceptions/exceptions.dart';
import 'package:flcore/utils/helpers/logger_helper.dart';

class Api implements ICall {
  late final Dio dio;

  Api({
    required String baseUrl,
    Map<String, String>? headers,
    bool enableLogs = false,
  }) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        validateStatus: (status) => true,
        headers: headers,
      ),
    );

    if (enableLogs) _enableLogs();
  }

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
      final Response<dynamic> response = await dio.request(
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

  void _enableLogs() {
    dio.interceptors.add(
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
