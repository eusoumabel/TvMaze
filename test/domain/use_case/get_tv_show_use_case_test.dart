import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';
import 'package:tv_maze/core/l10n/l10n.dart';
import 'package:tv_maze/core/util/safe_test_util.dart';
import 'package:tv_maze/domain/entities/tv_show_entity.dart';
import 'package:tv_maze/domain/use_case/get_tv_show_use_case.dart';
import 'package:tv_maze/service/remote/tv_show/tv_show_repository.dart';
import 'package:intl/date_symbol_data_local.dart';

class MockTvShowRepository extends Mock implements TvShowRepository {}

void main() async {
  initializeDateFormatting();
  await S.load(const Locale.fromSubtags(languageCode: 'en'));
  GetTvShowUseCaseTest().runTests();
}

class GetTvShowUseCaseTest extends SafeTest {
  late MockTvShowRepository repository;
  late GetTvShowUseCase useCase;

  GetTvShowUseCaseTest() {
    repository = MockTvShowRepository();
    useCase = GetTvShowUseCase(repository);
  }

  @override
  void runTests() {
    safeGroup(
      description: 'Get a tv show',
      body: () {
        onSuccess();
        onFail();
      },
    );
  }

  void onSuccess() {
    final response = TvShowEntity();
    safeTest(
      type: TypeTest.success,
      given: 'Given a url path',
      when: 'When the tv show information is requested',
      then: 'Then the TvShowEntity is returned',
      body: () async {
        // given
        const url = 'https://www.tvmaze.com/shows/1/under-the-dome';
        when(() => repository.getTvShow(url)).thenAnswer(
          (_) async => Success(response),
        );
        // when
        final result = await useCase(url: url);
        // then
        result.fold(
          (success) {
            expect(success, isA<TvShowEntity>());
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
      given: 'Given a url path',
      when: 'When the tv show information is requested',
      then: 'Then return a failure',
      body: () async {
        // given
        const url = 'https://www.tvmaze.com/shows/1/under-the-dome';
        when(() => repository.getTvShow(url)).thenAnswer(
          (_) async => Failure(Exception(S.current.errorFailureToGetTvShows)),
        );
        // when
        final result = await useCase(url: url);
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
