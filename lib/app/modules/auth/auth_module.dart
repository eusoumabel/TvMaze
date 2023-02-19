import 'package:flutter_modular/flutter_modular.dart';
import 'package:tv_maze/app/modules/auth/presenter/controller/splash_controller.dart';
import 'package:tv_maze/app/modules/auth/presenter/page/splash_page.dart';
import 'package:tv_maze/app/modules/home/home_module.dart';
import 'package:tv_maze/app/modules/home/presenter/page/home_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashController(
          safeSnackBar: i(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const SplashPage(),
    ),
    ModuleRoute(HomePage.route, module: HomeModule()),
  ];
}
