part of 'top_rated_movies_cubit.dart';

sealed class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState();

  @override
  List<Object> get props => [];
}

final class TopRatedMoviesInitial extends TopRatedMoviesState {}

final class TopRatedMoviesLoading extends TopRatedMoviesState {}

final class TopRatedMoviesFailure extends TopRatedMoviesState {
  final String errMessage;
  const TopRatedMoviesFailure(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}

final class TopRatedMoviesSuccess extends TopRatedMoviesState {
  final List<HomeEntity> moviesList;
  const TopRatedMoviesSuccess(this.moviesList);
  @override
  List<Object> get props => [moviesList];
}
