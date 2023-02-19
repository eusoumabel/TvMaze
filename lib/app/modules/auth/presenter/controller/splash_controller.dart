import 'package:flutter_modular/flutter_modular.dart';
import 'package:tv_maze/app/design/widgets/safe_snack_bar.dart';
import 'package:tv_maze/app/modules/home/presenter/page/home_page.dart';
import 'package:tv_maze/core/interfaces/safe_bloc.dart';

class SplashController extends SafeController {
  final SafeSnackBar safeSnackBar;
  SplashController({
    required this.safeSnackBar,
  });

  @override
  Future<void> init() async {
    logInfo();
    await Future.delayed(const Duration(seconds: 4));
    goToHome();
  }

  void goToHome() {
    logInfo();
    Modular.to.navigate(HomePage.route);
  }

  @override
  Future<void> dispose() async {
    logInfo();
  }
}
