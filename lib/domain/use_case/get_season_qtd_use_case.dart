import 'package:result_dart/result_dart.dart';
import 'package:tv_maze/core/interfaces/safe_use_case.dart';
import 'package:tv_maze/core/l10n/l10n.dart';
import 'package:tv_maze/service/remote/tv_show/tv_show_repository.dart';

class GetSeasonQtdtUseCase extends SafeUseCase {
  final TvShowRepository repository;

  GetSeasonQtdtUseCase(this.repository);

  AsyncResult<int, Exception> call({required num? id}) async {
    logInfo();
    if (id == null) {
      return Failure(Exception(S.current.errorFailureToGetEpisodes));
    }
    final response = await repository.getSeasonQtd(id);

    return response.fold(
      (success) {
        return Success(success);
      },
      (failure) {
        logError(error: failure);
        return Failure(Exception(S.current.errorFailureToGetEpisodes));
      },
    );
  }
}
