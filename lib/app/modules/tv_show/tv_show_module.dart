import 'package:flutter_modular/flutter_modular.dart';
import 'package:tv_maze/app/modules/tv_show/presenter/store/tv_show_store.dart';
import 'package:tv_maze/domain/use_case/get_episode_list_use_case.dart';
import 'package:tv_maze/domain/use_case/get_season_qtd_use_case.dart';
import 'package:tv_maze/domain/use_case/get_tv_show_use_case.dart';

import 'presenter/controller/tv_show_controller.dart';
import 'presenter/page/tv_show_page.dart';

class TvShowModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TvShowStore()),
    Bind.lazySingleton((i) => GetTvShowUseCase(i())),
    Bind.lazySingleton((i) => GetSeasonQtdtUseCase(i())),
    Bind.lazySingleton((i) => GetEpisodeListUseCase(i())),
    Bind.lazySingleton((i) => TvShowController(
          safeSnackBar: i(),
          store: i(),
          getTvShowUseCase: i(),
          getEpisodeListUseCase: i(),
          getSeasonQtdtUseCase: i(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => TvShowPage(tvShow: args.data),
    ),
  ];
}
