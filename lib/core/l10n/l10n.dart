// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Error: Failure to get TV shows`
  String get errorFailureToGetTvShows {
    return Intl.message(
      'Error: Failure to get TV shows',
      name: 'errorFailureToGetTvShows',
      desc: '',
      args: [],
    );
  }

  /// `We didn't find any tv shows that matches the search.`
  String get errorTvShowsNotFound {
    return Intl.message(
      'We didn\'t find any tv shows that matches the search.',
      name: 'errorTvShowsNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Exception: We didn't find any tv shows that matches the search.`
  String get exceptionTvShowsNotFound {
    return Intl.message(
      'Exception: We didn\'t find any tv shows that matches the search.',
      name: 'exceptionTvShowsNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, try again soon`
  String get errorTvShows {
    return Intl.message(
      'Something went wrong, try again soon',
      name: 'errorTvShows',
      desc: '',
      args: [],
    );
  }

  /// `Error: Failure to search TV shows`
  String get errorFailureToSearchTvShows {
    return Intl.message(
      'Error: Failure to search TV shows',
      name: 'errorFailureToSearchTvShows',
      desc: '',
      args: [],
    );
  }

  /// `Error: Failure to get episodes`
  String get errorFailureToGetEpisodes {
    return Intl.message(
      'Error: Failure to get episodes',
      name: 'errorFailureToGetEpisodes',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get textSearch {
    return Intl.message(
      'Search',
      name: 'textSearch',
      desc: '',
      args: [],
    );
  }

  /// `All TV Shows`
  String get textAllTvShows {
    return Intl.message(
      'All TV Shows',
      name: 'textAllTvShows',
      desc: '',
      args: [],
    );
  }

  /// `Search TV Shows`
  String get textSearchShows {
    return Intl.message(
      'Search TV Shows',
      name: 'textSearchShows',
      desc: '',
      args: [],
    );
  }

  /// `Schedule`
  String get textSchedule {
    return Intl.message(
      'Schedule',
      name: 'textSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get textSummary {
    return Intl.message(
      'Summary',
      name: 'textSummary',
      desc: '',
      args: [],
    );
  }

  /// `See more`
  String get textSeeMore {
    return Intl.message(
      'See more',
      name: 'textSeeMore',
      desc: '',
      args: [],
    );
  }

  /// `See less`
  String get textSeeLess {
    return Intl.message(
      'See less',
      name: 'textSeeLess',
      desc: '',
      args: [],
    );
  }

  /// `Genres`
  String get textGenres {
    return Intl.message(
      'Genres',
      name: 'textGenres',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get textRating {
    return Intl.message(
      'Rating',
      name: 'textRating',
      desc: '',
      args: [],
    );
  }

  /// `min per episode`
  String get textMinPerEpisode {
    return Intl.message(
      'min per episode',
      name: 'textMinPerEpisode',
      desc: '',
      args: [],
    );
  }

  /// `Seasons`
  String get textSeasons {
    return Intl.message(
      'Seasons',
      name: 'textSeasons',
      desc: '',
      args: [],
    );
  }

  /// `Season {index}`
  String textSeason(Object index) {
    return Intl.message(
      'Season $index',
      name: 'textSeason',
      desc: '',
      args: [index],
    );
  }

  /// `Episodes`
  String get textEpisodes {
    return Intl.message(
      'Episodes',
      name: 'textEpisodes',
      desc: '',
      args: [],
    );
  }

  /// `No seasons`
  String get textNoSeasons {
    return Intl.message(
      'No seasons',
      name: 'textNoSeasons',
      desc: '',
      args: [],
    );
  }

  /// `No episodes`
  String get textNoEpisodes {
    return Intl.message(
      'No episodes',
      name: 'textNoEpisodes',
      desc: '',
      args: [],
    );
  }

  /// `Episode {index}`
  String textEdisodeNum(Object index) {
    return Intl.message(
      'Episode $index',
      name: 'textEdisodeNum',
      desc: '',
      args: [index],
    );
  }

  /// `TV Maze`
  String get textTvMaze {
    return Intl.message(
      'TV Maze',
      name: 'textTvMaze',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
