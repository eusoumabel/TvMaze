import 'package:result_dart/result_dart.dart';
import 'package:tv_maze/domain/entities/episode_entity.dart';
import 'package:tv_maze/core/interfaces/safe_use_case.dart';
import 'package:tv_maze/core/l10n/l10n.dart';
import 'package:tv_maze/service/remote/tv_show/tv_show_repository.dart';

class GetEpisodeListUseCase extends SafeUseCase {
  final TvShowRepository repository;

  GetEpisodeListUseCase(this.repository);

  AsyncResult<List<EpisodeEntity>, Exception> call({required num? id}) async {
    logInfo();
    if (id == null) {
      return Failure(Exception(S.current.errorFailureToGetEpisodes));
    }
    final response = await repository.getEpisode(id);

    return response.fold(
      (success) => Success(
        success.map((e) => EpisodeEntity.fromModel(e)).toList(),
      ),
      (failure) {
        logError(error: failure);
        return Failure(Exception(S.current.errorFailureToGetTvShows));
      },
    );
  }
}
