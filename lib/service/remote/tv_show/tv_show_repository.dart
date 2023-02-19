import 'package:tv_maze/service/model/episode_model.dart';
import 'package:tv_maze/service/model/tv_show_model.dart';
import 'package:result_dart/result_dart.dart';

abstract class TvShowRepository {
  AsyncResult<List<TvShowModel>, Exception> getTvShows();

  AsyncResult<List<TvShowModel>, Exception> searchTvShows(String query);

  AsyncResult<TvShowModel, Exception> getTvShow(String url);

  AsyncResult<List<EpisodeModel>, Exception> getEpisode(num id);

  AsyncResult<int, Exception> getSeasonQtd(num id);
}
