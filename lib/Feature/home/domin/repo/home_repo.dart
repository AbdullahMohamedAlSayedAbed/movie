import 'package:dartz/dartz.dart';
import 'package:movie/Feature/home/domin/entities/actor_entity.dart';
import 'package:movie/Feature/home/domin/entities/actor_movies_entity.dart';
import 'package:movie/Feature/home/domin/entities/cast_entity.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';
import 'package:movie/Feature/home/domin/entities/recommendation_entity.dart';
import 'package:movie/Feature/home/domin/entities/video_entity.dart';
import 'package:movie/core/errors/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<HomeEntity>>> getNowPlaying();
  Future<Either<Failure, List<HomeEntity>>> getPopularMovies();
  Future<Either<Failure, List<HomeEntity>>> getTopRatedMovies();
  Future<Either<Failure, List<HomeEntity>>> getPopularPaginationMovies(
      {required int page});
  Future<Either<Failure, List<HomeEntity>>> getTopRatedPaginationMovies(
      {required int page});
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(int movieId);
  Future<Either<Failure, List<RecommendationEntity>>> getMovieRecommendations(
      int movieId);
  Future<Either<Failure, List<VideoEntity>>> getVideos(int movieId);
  Future<Either<Failure, List<CastEntity>>> getCast(int movieId);
  Future<Either<Failure, List<ActorMoviesEntity>>> getActorMovies(int personId);
  Future<Either<Failure, ActorEntity>> actorInfo(int personId);
  Future<Either<Failure, List<GenreEntity>>> getGenres();
  Future<Either<Failure, List<HomeEntity>>> getDiscoverMovies(
      {int page = 1, required int id});
}
