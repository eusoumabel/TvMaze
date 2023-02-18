import 'package:flutter_modular/flutter_modular.dart';
import 'package:tv_maze/app/modules/home/domain/use_case/get_tv_show_list_use_case.dart';
import 'package:tv_maze/app/modules/home/presenter/page/home_page.dart';

import 'presenter/controller/home_controller.dart';
import 'presenter/store/home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => GetTvShowUseCase(i())),
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
  ];
}
