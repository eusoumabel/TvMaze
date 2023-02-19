import 'package:tv_maze/core/state/safe_stream.dart';
import 'package:tv_maze/domain/entities/episode_entity.dart';
import 'package:tv_maze/domain/entities/tv_show_entity.dart';

class TvShowStore {
  final tvShow = SafeStream<TvShowEntity?>(data: null);
  final seasons = SafeStream<int>(data: 0);
  final episodes = SafeStream<List<EpisodeEntity>?>(data: []);
  void clear() {
    tvShow.data = null;
    seasons.data = 0;
    episodes.data = [];
  }
}
