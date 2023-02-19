class ApiConstants {
  static const String kUrl = 'https://api.tvmaze.com';

  static const String kGetShows = '$kUrl/shows';
  static const String kSearchTvShows = '$kUrl/search/shows?q=';
  static const String kGetEpisode = '$kUrl/shows/{id}/episodes';
  static const String kGetSeasons = '$kUrl/shows/{id}/seasons';
}
