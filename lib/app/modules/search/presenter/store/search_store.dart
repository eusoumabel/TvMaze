import 'package:flutter/material.dart';
import 'package:tv_maze/domain/entities/tv_show_entity.dart';
import 'package:tv_maze/core/state/safe_stream.dart';
import 'package:tv_maze/core/util/debauncer.dart';

class SearchStore {
  final searchText = TextEditingController();
  final listSearchedTvShows = SafeStream<List<TvShowEntity>>(data: []);
  final isCleanButtonVisible = SafeStream<bool>(data: false);
  final isSearchError = SafeStream<bool>(data: false);
  final scrollController = ScrollController();

  final Debouncer debouncer = Debouncer();

  void clear() {
    searchText.clear();
    listSearchedTvShows.data = [];
    isCleanButtonVisible.data = false;
    isSearchError.data = false;
    scrollController.dispose();
  }
}
