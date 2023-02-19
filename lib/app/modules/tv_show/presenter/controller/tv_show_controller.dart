import 'package:flutter_modular/flutter_modular.dart';
import 'package:tv_maze/app/design/widgets/safe_snack_bar.dart';
import 'package:tv_maze/app/modules/tv_show/presenter/store/tv_show_store.dart';
import 'package:tv_maze/core/constants/string_constants.dart';
import 'package:tv_maze/core/interfaces/safe_bloc.dart';
import 'package:tv_maze/domain/use_case/get_episode_list_use_case.dart';
import 'package:tv_maze/domain/use_case/get_season_qtd_use_case.dart';
import 'package:tv_maze/domain/use_case/get_tv_show_use_case.dart';

class TvShowController extends SafeController {
  final SafeSnackBar safeSnackBar;
  final TvShowStore store;
  final GetTvShowUseCase getTvShowUseCase;
  final GetEpisodeListUseCase getEpisodeListUseCase;
  final GetSeasonQtdtUseCase getSeasonQtdtUseCase;

  TvShowController({
    required this.safeSnackBar,
    required this.store,
    required this.getTvShowUseCase,
    required this.getEpisodeListUseCase,
    required this.getSeasonQtdtUseCase,
  });

  @override
  Future<void> init() async {
    logInfo(value: Modular.to.path);
    getSeasonQtd();
  }

  Future<void> getTvShow() async {
    if (store.tvShow.data != null) return;
    store.tvShow.loading();
    final result = await getTvShowUseCase(url: store.tvShow.data?.url);
    result.fold(
      (success) => store.tvShow.data = success,
      (failure) {
        logError(error: failure);
        store.tvShow.show();
        safeSnackBar.error(failure.toString());
      },
    );
  }

  Future<void> getSeasonQtd() async {
    logInfo();
    if (store.tvShow.data == null) return;
    store.seasons.loading();
    final result = await getSeasonQtdtUseCase(id: store.tvShow.data?.id);
    result.fold(
      (success) async {
        store.seasons.data = success;
        store.tvShow.data = store.tvShow.data?.copyWith(seasons: success);
        await getEpisodeList();
      },
      (failure) {
        logError(error: failure);
        store.seasons.show();
        safeSnackBar.error(failure.toString());
      },
    );
  }

  Future<void> getEpisodeList() async {
    logInfo();
    if (store.tvShow.data == null) return;
    store.episodes.loading();
    final result = await getEpisodeListUseCase(id: store.tvShow.data?.id);
    result.fold(
      (success) {
        store.episodes.data = success;
        return store.tvShow.data = store.tvShow.data?.copyWith(
          episodes: success,
        );
      },
      (failure) {
        logError(error: failure);
        store.episodes.show();
        safeSnackBar.error(failure.toString());
      },
    );
  }

  String get scheduleText {
    final tvShow = store.tvShow.data;
    final days = tvShow?.schedule?.days?[0] ?? StringConstants.empty;
    final time = tvShow?.schedule?.time ?? StringConstants.empty;
    return '$days ${StringConstants.hyphen} $time';
  }

  @override
  Future<void> dispose() async {
    logInfo();
    store.clear();
  }
}
