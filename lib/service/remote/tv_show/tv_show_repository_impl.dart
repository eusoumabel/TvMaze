import 'dart:convert';

import 'package:result_dart/result_dart.dart';
import 'package:tv_maze/service/configuration/constants/api_constants.dart';
import 'package:tv_maze/service/configuration/service/http_method.dart';
import 'package:tv_maze/service/configuration/service/safe_request.dart';
import 'package:tv_maze/service/configuration/service/safe_service.dart';
import 'package:tv_maze/service/configuration/service/safe_service_impl.dart';
import 'package:tv_maze/service/model/episode_model.dart';
import 'package:tv_maze/service/model/season_model.dart';
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

  @override
  AsyncResult<TvShowModel, Exception> getTvShow(String url) async {
    final request = SafeRequest(
      path: url,
      method: HttpMethod.get,
    );

    try {
      final response = await _service.doRequest(request);
      final data = TvShowModel.fromJson(json.decode(response.data));
      return Success(data);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  @override
  AsyncResult<List<EpisodeModel>, Exception> getEpisode(num id) async {
    final request = SafeRequest(
      path: ApiConstants.kGetEpisode.replaceAll('{id}', '$id'),
      method: HttpMethod.get,
    );

    try {
      final response = await _service.doRequest(request);
      final data = (json.decode(response.data) as List)
          .map((e) => EpisodeModel.fromJson(e))
          .toList();
      return Success(data);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  @override
  AsyncResult<int, Exception> getSeasonQtd(num id) async {
    final request = SafeRequest(
      path: ApiConstants.kGetSeasons.replaceAll('{id}', '$id'),
      method: HttpMethod.get,
    );

    try {
      final response = await _service.doRequest(request);
      final data = (json.decode(response.data) as List)
          .map((e) => SeasonModel.fromJson(e))
          .toList();
      return Success(data.length);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }
}
