import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tv_maze/app/design/widgets/safe_snack_bar.dart';
import 'package:tv_maze/app/modules/tv_show/presenter/page/tv_show_page.dart';
import 'package:tv_maze/domain/entities/tv_show_entity.dart';
import 'package:tv_maze/domain/use_case/get_tv_show_list_use_case.dart';
import 'package:tv_maze/app/modules/home/presenter/store/home_store.dart';
import 'package:tv_maze/app/modules/search/presenter/page/search_page.dart';
import 'package:tv_maze/core/interfaces/safe_bloc.dart';

class HomeController extends SafeController {
  final HomeStore store;
  final SafeSnackBar safeSnackBar;
  final GetTvShowListUseCase getTvShowUseCase;

  HomeController({
    required this.store,
    required this.safeSnackBar,
    required this.getTvShowUseCase,
  });

  @override
  Future<void> init() async {
    logInfo(value: Modular.to.path);
    await getTvShowList();
  }

  Future<void> getTvShowList() async {
    logInfo();
    store.listTvShows.loading();
    final result = await getTvShowUseCase();
    result.fold(
      (success) => store.listTvShows.data = success,
      (failure) {
        logError(error: failure);
        safeSnackBar.error(failure.toString());
      },
    );
  }

  void goToTheTop() {
    logInfo();
    store.scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  void goToSearchPage() {
    logInfo();
    Modular.to.pushNamed(Modular.to.path + SearchPage.route);
  }

  void goToTvShow({required TvShowEntity tvShow}) {
    logInfo();
    Modular.to.pushNamed(
      Modular.to.path + TvShowPage.route,
      arguments: tvShow,
    );
  }

  @override
  Future<void> dispose() async {
    logInfo();
    store.clear();
  }
}
