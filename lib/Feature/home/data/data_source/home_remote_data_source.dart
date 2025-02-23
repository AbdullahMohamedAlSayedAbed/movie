import 'package:movie/Feature/home/data/models/actor_model.dart';
import 'package:movie/Feature/home/data/models/actor_movies_model.dart';
import 'package:movie/Feature/home/data/models/casts_model.dart';
import 'package:movie/Feature/home/data/models/home_model.dart';
import 'package:movie/Feature/home/data/models/movie_details_model.dart';
import 'package:movie/Feature/home/data/models/recommendation_model.dart';
import 'package:movie/Feature/home/data/models/video_model.dart';
import 'package:movie/Feature/home/domin/entities/actor_entity.dart';
import 'package:movie/Feature/home/domin/entities/actor_movies_entity.dart';
import 'package:movie/Feature/home/domin/entities/cast_entity.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';
import 'package:movie/Feature/home/domin/entities/recommendation_entity.dart';
import 'package:movie/Feature/home/domin/entities/video_entity.dart';
import 'package:movie/core/constants/api_constants.dart';
import 'package:movie/core/utils/api_service.dart';

abstract class BaseHomeRemoteDataSource {
  Future<List<HomeEntity>> getNowPlayingMovies();
  Future<List<HomeEntity>> getPopularMovies();
  Future<List<HomeEntity>> getTopRatedMovies();
  Future<List<HomeEntity>> getPopularPaginationMovies({int page = 1});
  Future<List<HomeEntity>> getTopRatedPaginationMovies({int page = 1});
  Future<MovieDetailsEntity> getMovieDetails(int movieId);
  Future<List<RecommendationEntity>> getRecommendations(int movieId);
  Future<List<VideoEntity>> getVideos(int movieId);
  Future<List<CastEntity>> getCast(int movieId);
  Future<List<ActorMoviesEntity>> getActorMovies(int movieId);
  Future<List<GenreEntity>> getGenres();
  Future<List<HomeEntity>> getDiscoverMovies({int page = 1, required int id});
  Future<ActorEntity> actorInfo(int id);
}

class HomeRemoteDataSource extends BaseHomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSource({required this.apiService});
  @override
  Future<List<HomeEntity>> getNowPlayingMovies() async {
    final response = await apiService.get(endPoint: ApiConstants.nowPlaying);
    List<HomeEntity> moviesList = getMoviesList(response);
    return moviesList;
  }

  @override
  Future<List<HomeEntity>> getPopularMovies() async {
    final response = await apiService.get(endPoint: ApiConstants.popular);
    List<HomeEntity> moviesList = getMoviesList(response);
    return moviesList;
  }

  @override
  Future<List<HomeEntity>> getTopRatedMovies() async {
    final response = await apiService.get(endPoint: ApiConstants.topRated);
    List<HomeEntity> moviesList = getMoviesList(response);
    return moviesList;
  }

  @override
  Future<List<HomeEntity>> getPopularPaginationMovies({int page = 1}) async {
    final response = await apiService.getAndPagination(
      endPoint: ApiConstants.popular,
      page: page,
    );
    List<HomeEntity> moviesList = getMoviesList(response);
    return moviesList;
  }

  @override
  Future<List<HomeEntity>> getTopRatedPaginationMovies({int page = 1}) async {
    final response = await apiService.getAndPagination(
      endPoint: ApiConstants.topRated,
      page: page,
    );
    List<HomeEntity> moviesList = getMoviesList(response);
    return moviesList;
  }

  List<HomeEntity> getMoviesList(Map<String, dynamic> data) {
    List<HomeEntity> moviesList = [];
    for (var movie in data['results']) {
      moviesList.add(HomeModel.fromJson(movie));
    }
    return moviesList;
  }

  @override
  Future<MovieDetailsEntity> getMovieDetails(int movieId) async {
    final response =
        await apiService.get(endPoint: ApiConstants.movieDetails(movieId));
    MovieDetailsEntity movieDetail = MovieDetailsModel.fromJson(response);
    return movieDetail;
  }

  @override
  Future<List<RecommendationEntity>> getRecommendations(int movieId) async {
    final response =
        await apiService.get(endPoint: ApiConstants.recommendations(movieId));
    List<RecommendationEntity> recommendationList =
        getRecommendationList(response);
    return recommendationList;
  }

  List<RecommendationEntity> getRecommendationList(Map<String, dynamic> data) {
    List<RecommendationEntity> recommendationList = [];
    for (var movie in data['results']) {
      recommendationList.add(RecommendationModel.fromJson(movie));
    }
    return recommendationList;
  }

  @override
  Future<List<VideoEntity>> getVideos(int movieId) async {
    final response =
        await apiService.get(endPoint: ApiConstants.getVideos(movieId));
    List<VideoEntity> videos = getVideosList(response);
    return videos;
  }

  List<VideoEntity> getVideosList(Map<String, dynamic> data) {
    List<VideoEntity> videoList = [];
    for (var movie in data['results']) {
      videoList.add(VideoModel.fromJson(movie));
    }
    return videoList;
  }

  @override
  Future<List<CastEntity>> getCast(int movieId) async {
    final response =
        await apiService.get(endPoint: ApiConstants.getCastPath(movieId));
    List<CastEntity> castList = getCastList(response);
    return castList;
  }

  List<CastEntity> getCastList(Map<String, dynamic> data) {
    List<CastEntity> castList = [];
    for (var movie in data['cast']) {
      castList.add(CastsModel.fromJson(movie));
    }
    return castList;
  }

  @override
  Future<List<GenreEntity>> getGenres() async {
    final response = await apiService.get(endPoint: ApiConstants.genres);
    List<GenreEntity> genresList = (response['genres'] as List)
        .map((e) => GenreModel.fromJson(e) as GenreEntity)
        .toList();
    return genresList;
  }

  @override
  Future<List<HomeEntity>> getDiscoverMovies(
      {int page = 1, required int id}) async {
    final response = await apiService.getAndPaginationAndDiscover(
        endPoint: ApiConstants.discover, genreId: id, page: page);
    List<HomeEntity> discoverMovies = getMoviesList(response);
    return discoverMovies;
  }

  @override
  Future<ActorEntity> actorInfo(int id) async {
    final response =
        await apiService.get(endPoint: ApiConstants.personActor(id));
    ActorEntity actor = ActorModel.fromJson(response);
    return actor;
  }

  @override
  Future<List<ActorMoviesEntity>> getActorMovies(int movieId) async {
    final response =
        await apiService.get(endPoint: ApiConstants.personActorMovies(movieId));
    List<ActorMoviesEntity> actorMovies =
        (response['cast'] as List).map((movieData) {
      return ActorMoviesModel.fromJson(movieData);
    }).toList();
    return actorMovies;
  }
}
