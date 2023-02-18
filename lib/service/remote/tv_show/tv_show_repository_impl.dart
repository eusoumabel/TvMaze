import 'dart:convert';

import 'package:result_dart/result_dart.dart';
import 'package:tv_maze/service/configuration/constants/api_constants.dart';
import 'package:tv_maze/service/configuration/service/http_method.dart';
import 'package:tv_maze/service/configuration/service/safe_request.dart';
import 'package:tv_maze/service/configuration/service/safe_service.dart';
import 'package:tv_maze/service/configuration/service/safe_service_impl.dart';
import 'package:tv_maze/service/model/tv_show_model.dart';
import 'package:tv_maze/service/remote/tv_show/tv_show_repository.dart';

class TvShowRepositoryImpl extends TvShowRepository {
  final SafeService _service = SafeServiceImpl();

  @override
  AsyncResult<List<TvShowModel>, Exception> getTvShows() async {
    final request = SafeRequest(
      path: ApiConstants.kGetShows,
      method: HttpMethod.get,
    );

    try {
      final response = await _service.doRequest(request);
      final data = (json.decode(response.data) as List)
          .map((e) => TvShowModel.fromJson(e))
          .toList();
      return Success(data);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  @override
  AsyncResult<List<TvShowModel>, Exception> searchTvShows(String query) async {
    final request = SafeRequest(
      path: ApiConstants.kSearchTvShows + query,
      method: HttpMethod.get,
    );

    try {
      final response = await _service.doRequest(request);
      final data = (json.decode(response.data) as List)
          .map((e) => TvShowModel.fromJson(e['show']))
          .toList();
      return Success(data);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }
}
