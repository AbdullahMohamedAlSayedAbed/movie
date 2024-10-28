import 'package:movie/Feature/home/data/models/home_model.dart';
import 'package:movie/Feature/home/data/models/movie_details_model.dart';
import 'package:movie/Feature/home/data/models/recommendation_model.dart';
import 'package:movie/Feature/home/data/models/video_model.dart';
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
  Future<MovieDetailsEntity> getMovieDetails(int movieId);
  Future<List<RecommendationEntity>> getRecommendations(int movieId);
  Future<List<VideoEntity>> getVideos(int movieId);
  

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
  Future<List<VideoEntity>> getVideos(int movieId) async{
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
}
