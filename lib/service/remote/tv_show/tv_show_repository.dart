import 'package:tv_maze/service/model/tv_show_model.dart';
import 'package:result_dart/result_dart.dart';

abstract class TvShowRepository {
  AsyncResult<List<TvShowModel>, Exception> getTvShows();

  AsyncResult<List<TvShowModel>, Exception> searchTvShows(String query);
}
