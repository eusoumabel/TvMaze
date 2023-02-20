import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';
import 'package:tv_maze/core/l10n/l10n.dart';
import 'package:tv_maze/core/util/safe_test_util.dart';
import 'package:tv_maze/domain/entities/episode_entity.dart';
import 'package:tv_maze/domain/use_case/get_episode_list_use_case.dart';
import 'package:tv_maze/service/remote/tv_show/tv_show_repository.dart';
import 'package:intl/date_symbol_data_local.dart';

class MockTvShowRepository extends Mock implements TvShowRepository {}

void main() async {
  initializeDateFormatting();
  await S.load(const Locale.fromSubtags(languageCode: 'en'));
  GetEpisodeListUseCaseTest().runTests();
}

class GetEpisodeListUseCaseTest extends SafeTest {
  late MockTvShowRepository repository;
  late GetEpisodeListUseCase useCase;

  GetEpisodeListUseCaseTest() {
    repository = MockTvShowRepository();
    useCase = GetEpisodeListUseCase(repository);
  }

  @override
  void runTests() {
    safeGroup(
      description: 'Get a list of episodes',
      body: () {
        onSuccess();
        onFail();
      },
    );
  }

  void onSuccess() {
    final response = [EpisodeEntity(), EpisodeEntity()];
    safeTest(
      type: TypeTest.success,
      given: 'Given tv show id is requested',
      when: 'When the list of episodes is requested',
      then: 'Then the list of EpisodeEntity is returned',
      body: () async {
        // given
        const id = 1;
        when(() => repository.getEpisode(id)).thenAnswer(
          (_) async => Success(response),
        );
        // when
        final result = await useCase(id: id);
        // then
        result.fold(
          (success) {
            expect(success, isA<List<EpisodeEntity>>());
          },
          (failure) {
            expect(failure, null);
          },
        );
      },
    );
  }

  void onFail() {
    safeTest(
      type: TypeTest.error,
      given: 'Given tv show id is requested',
      when: 'When the list of episodes is requested',
      then: 'Then return a failure',
      body: () async {
        // given
        const id = 1;
        when(() => repository.getEpisode(id)).thenAnswer(
          (_) async => Failure(Exception(S.current.errorFailureToGetEpisodes)),
        );
        // when
        final result = await useCase(id: id);
        // then
        result.fold(
          (success) {
            expect(success, null);
          },
          (failure) {
            expect(failure, isNotNull);
            expect(failure, isA<Exception>());
          },
        );
      },
    );
  }
}
