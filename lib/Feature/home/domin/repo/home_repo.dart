import 'package:dartz/dartz.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';
import 'package:movie/Feature/home/domin/entities/recommendation_entity.dart';
import 'package:movie/core/errors/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<HomeEntity>>> getNowPlaying();
  Future<Either<Failure, List<HomeEntity>>> getPopularMovies();
  Future<Either<Failure, List<HomeEntity>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(int movieId);
  Future<Either<Failure, List<RecommendationEntity>>> getMovieRecommendations(
      int movieId);
}
