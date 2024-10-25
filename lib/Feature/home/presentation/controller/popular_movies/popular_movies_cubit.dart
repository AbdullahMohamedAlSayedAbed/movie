import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/domin/repo/home_repo.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit(this.homeRepository) : super(PopularMoviesInitial());
  final HomeRepository homeRepository;

  Future<void> getPopularMovies() async {
    emit(PopularMoviesLoading());
    final result = await homeRepository.getPopularMovies();
    result.fold(
      (failure) => emit(PopularMoviesFailure(failure.message)),
      (movies) => emit(PopularMoviesSuccess(movies)),
    );
  }
}
