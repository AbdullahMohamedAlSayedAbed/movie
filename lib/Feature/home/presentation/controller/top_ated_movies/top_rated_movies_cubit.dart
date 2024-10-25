import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/domin/repo/home_repo.dart';

part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  TopRatedMoviesCubit(this.homeRepository) : super(TopRatedMoviesInitial());
  final HomeRepository homeRepository;

  Future<void> getTopRatedMovies() async {
    emit(TopRatedMoviesLoading());
    final result = await homeRepository.getTopRatedMovies();
    result.fold(
      (failure) => emit(TopRatedMoviesFailure(failure.message)),
      (movies) => emit(TopRatedMoviesSuccess(movies)),
    );
  }
}
