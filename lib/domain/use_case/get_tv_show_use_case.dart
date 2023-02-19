import 'package:result_dart/result_dart.dart';
import 'package:tv_maze/domain/entities/tv_show_entity.dart';
import 'package:tv_maze/core/interfaces/safe_use_case.dart';
import 'package:tv_maze/core/l10n/l10n.dart';
import 'package:tv_maze/service/remote/tv_show/tv_show_repository.dart';

class GetTvShowUseCase extends SafeUseCase {
  final TvShowRepository repository;

  GetTvShowUseCase(this.repository);

  AsyncResult<TvShowEntity, Exception> call({required String? url}) async {
    logInfo();
    if (url == null) {
      return Failure(Exception(S.current.errorFailureToGetTvShows));
    }
    final response = await repository.getTvShow(url);

    return response.fold(
      (success) => Success(TvShowEntity.fromModel(success)),
      (failure) {
        logError(error: failure);
        return Failure(Exception(S.current.errorFailureToGetTvShows));
      },
    );
  }
}
