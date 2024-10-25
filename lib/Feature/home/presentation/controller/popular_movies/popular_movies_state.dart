part of 'popular_movies_cubit.dart';

sealed class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

final class PopularMoviesInitial extends PopularMoviesState {}
final class PopularMoviesLoading extends PopularMoviesState {}

final class PopularMoviesSuccess extends PopularMoviesState {
  final List<HomeEntity> moviesList;
  const PopularMoviesSuccess(this.moviesList);

  @override
  List<Object> get props => [moviesList];
}

final class PopularMoviesFailure extends PopularMoviesState {
  final String message;
  const PopularMoviesFailure(this.message);

  @override
  List<Object> get props => [message];
}

