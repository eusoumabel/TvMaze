import 'package:flutter_modular/flutter_modular.dart';
import 'package:tv_maze/app/modules/tv_show/presenter/page/tv_show_page.dart';
import 'package:tv_maze/app/modules/tv_show/tv_show_module.dart';
import 'package:tv_maze/domain/use_case/get_tv_show_list_use_case.dart';
import 'package:tv_maze/app/modules/home/presenter/page/home_page.dart';
import 'package:tv_maze/app/modules/search/presenter/page/search_page.dart';
import 'package:tv_maze/app/modules/search/search_module.dart';

import 'presenter/controller/home_controller.dart';
import 'presenter/store/home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => GetTvShowListUseCase(i())),
    Bind.lazySingleton((i) => HomeController(
          safeSnackBar: i(),
          store: i(),
          getTvShowUseCase: i(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const HomePage(),
    ),
    ModuleRoute(SearchPage.route, module: SearchModule()),
    ModuleRoute(
      TvShowPage.route,
      module: TvShowModule(),
      transition: TransitionType.fadeIn,
      duration: const Duration(milliseconds: 200),
    ),
  ];
}
