import 'package:flutter_modular/flutter_modular.dart';
import 'package:tv_maze/domain/use_case/search_tv_shows_use_case.dart';
import 'package:tv_maze/app/modules/search/presenter/controller/search_controller.dart';
import 'package:tv_maze/app/modules/search/presenter/page/search_page.dart';
import 'package:tv_maze/app/modules/search/presenter/store/search_store.dart';

class SearchModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SearchStore()),
    Bind.lazySingleton((i) => SearchTvShowUseCase(i())),
    Bind.lazySingleton((i) => SearchController(
          safeSnackBar: i(),
          store: i(),
          searchTvShowsUseCase: i(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const SearchPage(),
    ),
  ];
}
