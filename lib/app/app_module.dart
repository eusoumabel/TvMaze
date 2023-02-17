import 'package:flutter_modular/flutter_modular.dart';
import 'package:tv_maze/app/design/widgets/safe_snack_bar.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<ISafeSnackBar>((i) => SafeSnackBar()),
  ];

  @override
  final List<ModularRoute> routes = [
    // ModuleRoute(Modular.initialRoute, module: AuthModule()),
    // ModuleRoute(NavigationPage.route, module: NavigationModule()),
  ];
}
