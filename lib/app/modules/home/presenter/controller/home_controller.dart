import 'package:tv_maze/app/design/widgets/safe_snack_bar.dart';
import 'package:tv_maze/app/modules/home/domain/use_case/get_tv_show_list_use_case.dart';
import 'package:tv_maze/app/modules/home/presenter/store/home_store.dart';
import 'package:tv_maze/core/interfaces/safe_bloc.dart';

class HomeController extends SafeController {
  final HomeStore store;
  final SafeSnackBar safeSnackBar;
  final GetTvShowUseCase getTvShowUseCase;

  HomeController({
    required this.store,
    required this.safeSnackBar,
    required this.getTvShowUseCase,
  });

  @override
  Future<void> init() async {
    await getTvShowList();
  }

  Future<void> getTvShowList() async {
    logInfo();
    final result = await getTvShowUseCase();
    result.fold(
      (success) => store.listTvShows.data = success,
      (failure) {
        logError(error: failure);
        safeSnackBar.error(failure.toString());
      },
    );
  }

  @override
  Future<void> dispose() async {}
}
