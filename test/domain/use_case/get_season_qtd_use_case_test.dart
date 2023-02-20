import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';
import 'package:tv_maze/core/l10n/l10n.dart';
import 'package:tv_maze/core/util/safe_test_util.dart';
import 'package:tv_maze/domain/use_case/get_season_qtd_use_case.dart';
import 'package:tv_maze/service/remote/tv_show/tv_show_repository.dart';
import 'package:intl/date_symbol_data_local.dart';

class MockTvShowRepository extends Mock implements TvShowRepository {}

void main() async {
  initializeDateFormatting();
  await S.load(const Locale.fromSubtags(languageCode: 'en'));
  GetSeasonQtdUseCaseTest().runTests();
}

class GetSeasonQtdUseCaseTest extends SafeTest {
  late MockTvShowRepository repository;
  late GetSeasonQtdtUseCase useCase;

  GetSeasonQtdUseCaseTest() {
    repository = MockTvShowRepository();
    useCase = GetSeasonQtdtUseCase(repository);
  }

  @override
  void runTests() {
    safeGroup(
      description: 'Get number of seasons from a Tv Show',
      body: () {
        onSuccess();
        onFail();
      },
    );
  }

  void onSuccess() {
    const response = 5;
    safeTest(
      type: TypeTest.success,
      given: 'Given a Tv Show id',
      when: 'When the number of seasons is requested',
      then: 'Then the number of seasons is returned',
      body: () async {
        // given
        const id = 1;
        when(() => repository.getSeasonQtd(id)).thenAnswer(
          (_) async => const Success(response),
        );
        // when
        final result = await useCase(id: id);
        // then
        result.fold(
          (success) {
            expect(success, isA<int>());
            expect(success, response);
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
      given: 'Given a Tv Show id',
      when: 'When the number of seasons is requested',
      then: 'Then return a failure',
      body: () async {
        // given
        const id = 1;
        when(() => repository.getSeasonQtd(id)).thenAnswer(
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
