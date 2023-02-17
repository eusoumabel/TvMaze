import 'package:dio/dio.dart';
import 'package:tv_maze/service/configuration/service/safe_request.dart';

abstract class SafeService {
  Future<Response> doRequest(SafeRequest config);
  Future<Response> post(SafeRequest config);
  Future<Response> get(SafeRequest config);
  Future<Response> patch(SafeRequest config);
  Future<Response> put(SafeRequest config);
  Future<Response> delete(SafeRequest config);
  Response getResponse(Response response);
}
