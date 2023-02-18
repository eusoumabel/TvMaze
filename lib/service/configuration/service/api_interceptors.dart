import 'package:dio/dio.dart';
import 'package:tv_maze/core/util/safe_log_util.dart';

class SafeInterceptions extends QueuedInterceptorsWrapper {
  final Dio dio;
  SafeInterceptions(this.dio);

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    SafeLogImpl.instance.onRequestLog(
      path: options.path,
      header: options.headers.toString(),
      body: options.data.toString(),
      http: options.method,
    );
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    SafeLogImpl.instance.onResponseLog(
      path: response.requestOptions.path,
      statusCode: response.statusCode,
      header: response.headers.toString(),
      params: response.requestOptions.data.toString(),
      body: response.data,
    );
    return super.onResponse(response, handler);
  }

  @override
  onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    SafeLogImpl.instance.onResponseLog(
      path: err.requestOptions.path,
      statusCode: err.response?.statusCode,
      header: err.requestOptions.headers.toString(),
      params: err.requestOptions.data.toString(),
      body: err.response?.data.toString(),
      isError: true,
    );
    return super.onError(err, handler);
  }
}
