abstract class ApiConstants {
  static const baseUrl = 'https://api.themoviedb.org/3/';
  static const apiKey = 'api_key=84736eb4431dd15938f5308fdb362099';
  static const language = 'language=en-US';
  static const nowPlaying = 'movie/now_playing';
  static const popular = 'movie/popular';
  static const topRated = 'movie/top_rated';
  static String movieDetails(int movieId) => 'movie/$movieId';
  static String recommendations(int movieId) => 'movie/$movieId/recommendations';
  static const baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$baseImageUrl$path';
}
