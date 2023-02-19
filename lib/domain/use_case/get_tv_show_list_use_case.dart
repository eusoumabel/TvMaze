import 'package:result_dart/result_dart.dart';
import 'package:tv_maze/domain/entities/tv_show_entity.dart';
import 'package:tv_maze/core/interfaces/safe_use_case.dart';
import 'package:tv_maze/core/l10n/l10n.dart';
import 'package:tv_maze/service/remote/tv_show/tv_show_repository.dart';

class GetTvShowListUseCase extends SafeUseCase {
  final TvShowRepository repository;

  GetTvShowListUseCase(this.repository);

  AsyncResult<List<TvShowEntity>, Exception> call() async {
    logInfo();
    final response = await repository.getTvShows();

    return response.fold(
      (success) {
        return Success(success.map((e) => TvShowEntity.fromModel(e)).toList());
      },
      (failure) {
        logError(error: failure);
        return Failure(Exception(S.current.errorFailureToGetTvShows));
      },
    );
  }
}
