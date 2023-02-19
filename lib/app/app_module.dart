import 'package:flutter_modular/flutter_modular.dart';
import 'package:tv_maze/app/design/widgets/safe_snack_bar.dart';
import 'package:tv_maze/app/modules/auth/auth_module.dart';
import 'package:tv_maze/app/modules/home/home_module.dart';
import 'package:tv_maze/app/modules/home/presenter/page/home_page.dart';
import 'package:tv_maze/service/remote/tv_show/tv_show_repository.dart';
import 'package:tv_maze/service/remote/tv_show/tv_show_repository_impl.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<ISafeSnackBar>((i) => SafeSnackBar()),
    Bind.lazySingleton<TvShowRepository>((i) => TvShowRepositoryImpl()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: AuthModule()),
    ModuleRoute(HomePage.route, module: HomeModule()),
  ];
}
