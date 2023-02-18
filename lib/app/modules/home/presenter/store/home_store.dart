import 'package:tv_maze/app/modules/home/domain/entities/tv_show_entity.dart';
import 'package:tv_maze/core/state/safe_stream.dart';

class HomeStore {
  final listTvShows = SafeStream<List<TvShowEntity>>(data: []);
}
