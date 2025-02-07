abstract class ApiConstants {
  static const baseUrl = 'https://api.themoviedb.org/3/';
  static const apiKey = 'api_key=84736eb4431dd15938f5308fdb362099';
  static const language = 'language=en-US';
  static const nowPlaying = 'movie/now_playing';
  static const popular = 'movie/popular';
  static const topRated = 'movie/top_rated';
  static const search = 'search/movie';
  static const searchActors = 'search/person';
  static const personPopular = 'person/popular';
  static const String genres = 'genre/movie/list';
  static const String discover = 'discover/movie';

  static String movieDetails(int movieId) => 'movie/$movieId';
  static String personActor(int personId) => 'person/$personId';
  static String personActorMovies(int personId) => 'person/$personId/movie_credits';
  static String getVideos(int movieId) => 'movie/$movieId/videos';
  static String recommendations(int movieId) =>
      'movie/$movieId/recommendations';
  static String getCastPath(int movieId) => 'movie/$movieId/credits';
  static const baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$baseImageUrl$path';
}