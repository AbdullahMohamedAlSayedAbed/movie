import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/Feature/home/domin/entities/actor_movies_entity.dart';
import 'package:movie/Feature/home/domin/repo/home_repo.dart';

part 'actor_movies_state.dart';

class ActorMoviesCubit extends Cubit<ActorMoviesState> {
  ActorMoviesCubit(this.homeRepository) : super(ActorMoviesInitial());
  final HomeRepository homeRepository;
    Future<void> getActorMovies(int movieId) async {
    emit(ActorMoviesLoading());
    final result = await homeRepository.getActorMovies(movieId);
    result.fold(
      (failure) => emit(ActorMoviesFailure(failure.message)),
      (movieCasts) => emit(ActorMoviesSuccess(movieCasts)),
    );
  }
}
