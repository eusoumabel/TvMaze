import 'package:flutter/material.dart';
import 'package:tv_maze/app/design/widgets/safe_snack_bar.dart';
import 'package:tv_maze/domain/use_case/search_tv_shows_use_case.dart';
import 'package:tv_maze/app/modules/search/presenter/store/search_store.dart';
import 'package:tv_maze/core/interfaces/safe_bloc.dart';
import 'package:tv_maze/core/l10n/l10n.dart';

class SearchController extends SafeController {
  final SearchStore store;
  final SafeSnackBar safeSnackBar;
  final SearchTvShowUseCase searchTvShowsUseCase;

  SearchController({
    required this.store,
    required this.safeSnackBar,
    required this.searchTvShowsUseCase,
  });

  @override
  Future<void> init() async {
    logInfo();
  }

  Future<void> searchTvShow(String value) async {
    logInfo();
    if (value.trim().isEmpty) {
      onClearSearch();
      return;
    }
    store.listSearchedTvShows.loading();
    store.isCleanButtonVisible.data = true;
    final result = await searchTvShowsUseCase(value.trim());
    result.fold(
      (success) {
        store.isSearchError.data = false;
        store.listSearchedTvShows.data = success;
      },
      (failure) {
        logError(error: failure);
        store.listSearchedTvShows.show();
        store.isSearchError.data = true;
        if (failure.toString() != S.current.exceptionTvShowsNotFound) {
          safeSnackBar.error(failure.toString());
        }
      },
    );
  }

  void goToTheTop() {
    store.scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  void onClearSearch() {
    logInfo();
    store.isCleanButtonVisible.data = false;
    store.listSearchedTvShows.data = [];
    store.isSearchError.data = false;
    store.searchText.clear();
  }

  @override
  Future<void> dispose() async {
    store.clear();
  }
}
