part of 'actor_movies_cubit.dart';

sealed class ActorMoviesState extends Equatable {
  const ActorMoviesState();

  @override
  List<Object> get props => [];
}

final class ActorMoviesInitial extends ActorMoviesState {}

final class ActorMoviesLoading extends ActorMoviesState {}

final class ActorMoviesSuccess extends ActorMoviesState {
  final List<ActorMoviesEntity> actorMovies;

  const ActorMoviesSuccess(this.actorMovies);

  @override
  List<Object> get props => [actorMovies];
}

final class ActorMoviesFailure extends ActorMoviesState {
  final String errMessage;

  const ActorMoviesFailure(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}
