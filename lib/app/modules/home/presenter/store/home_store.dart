import 'package:flutter/material.dart';
import 'package:tv_maze/domain/entities/tv_show_entity.dart';
import 'package:tv_maze/core/state/safe_stream.dart';

class HomeStore {
  final listTvShows = SafeStream<List<TvShowEntity>>(data: []);
  final scrollController = ScrollController();

  void clear() {
    listTvShows.data = [];
    scrollController.dispose();
  }
}
