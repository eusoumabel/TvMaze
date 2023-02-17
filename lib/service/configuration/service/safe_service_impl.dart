import 'package:dio/dio.dart';
import 'package:tv_maze/service/configuration/error/safe_exceptions.dart';
import 'package:tv_maze/service/configuration/service/api_interceptors.dart';
import 'package:tv_maze/service/configuration/service/http_method.dart';
import 'package:tv_maze/service/configuration/service/safe_request.dart';
import 'package:tv_maze/service/configuration/service/safe_service.dart';

class SafeServiceImpl implements SafeService {
  final Dio dio = createDio();
  SafeServiceImpl._internal();
  static final _singleton = SafeServiceImpl._internal();
  factory SafeServiceImpl() => _singleton;

  static const _timeout = Duration(minutes: 2);

  static Dio createDio() {
    var dio = Dio(
      BaseOptions(
        receiveTimeout: _timeout.inMilliseconds,
        connectTimeout: _timeout.inMilliseconds,
        sendTimeout: _timeout.inMilliseconds,
        responseType: ResponseType.plain,
      ),
    );
    dio.interceptors.addAll({SafeInterceptions(dio)});
    return dio;
  }

  @override
  Future<Response> doRequest(SafeRequest config) async {
    Response response;
    try {
      switch (config.method) {
        case HttpMethod.post:
          response = await post(config);
          break;
        case HttpMethod.get:
          response = await get(config);
          break;
        case HttpMethod.patch:
          response = await patch(config);
          break;
        case HttpMethod.delete:
          response = await delete(config);
          break;
        case HttpMethod.put:
          response = await put(config);
          break;
      }
      return response;
    } catch (e) {
      throw SafeExeptions.onError(e);
    }
  }

  @override
  Future<Response> post(SafeRequest config) async {
    final response = await dio
        .post(
          config.path,
          data: config.body,
          options: config.options,
          queryParameters: config.parameters,
        )
        .timeout(_timeout);
    return getResponse(response);
  }

  @override
  Future<Response> get(SafeRequest config) async {
    final response = await dio
        .get(
          config.path,
          options: config.options,
          queryParameters: config.parameters,
        )
        .timeout(_timeout);
    return getResponse(response);
  }

  @override
  Future<Response> patch(SafeRequest config) async {
    final response = await dio
        .patch(
          config.path,
          data: config.body,
          options: config.options,
          queryParameters: config.parameters,
        )
        .timeout(_timeout);
    return getResponse(response);
  }

  @override
  Future<Response> put(SafeRequest config) async {
    final response = await dio
        .put(
          config.path,
          data: config.body,
          options: config.options,
          queryParameters: config.parameters,
        )
        .timeout(_timeout);
    return getResponse(response);
  }

  @override
  Future<Response> delete(SafeRequest config) async {
    final response = await dio
        .delete(
          config.path,
          data: config.body,
          options: config.options,
          queryParameters: config.parameters,
        )
        .timeout(_timeout);
    return getResponse(response);
  }

  @override
  Response getResponse(Response response) {
    final isSuccess = response.statusCode! >= 200 && response.statusCode! < 300;

    if (isSuccess) {
      try {
        return response;
      } catch (e) {
        throw SafeExeptions.onError(e);
      }
    } else {
      throw SafeExeptions.onError(response.data.toString());
    }
  }
}
