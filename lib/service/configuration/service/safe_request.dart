import 'package:dio/dio.dart';
import 'package:tv_maze/service/configuration/service/http_method.dart';

class SafeRequest {
  final String path;
  final HttpMethod method;
  final dynamic body;
  final Map<String, dynamic>? parameters;
  final Options? options;

  SafeRequest({
    required this.path,
    required this.method,
    this.options,
    this.body,
    this.parameters,
  });
}
