import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/domin/repo/home_repo.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit(this.homeRepository) : super(PopularMoviesInitial());
  final HomeRepository homeRepository;
  int _currentPage = 2;
  bool _isLoading = false;
  bool _isLastPage = false;
  Future<void> getPopularMovies() async {
    emit(PopularMoviesLoading());
    final result = await homeRepository.getPopularMovies();
    result.fold(
      (failure) => emit(PopularMoviesFailure(failure.message)),
      (movies) {
        emit(PopularMoviesSuccess(movies));
        _currentPage = 2;
        _isLastPage = false;
      },
    );
  }

  Future<void> getPopularPaginationMovies() async {
    if (_isLoading || _isLastPage) return;
    _isLoading = true;
    emit(PopularMoviesPaginationLoading());
    final result =
        await homeRepository.getPopularPaginationMovies(page: _currentPage);
    result.fold(
      (failure) {
        emit(PopularMoviesPaginationFailure(failure.message));
        _isLoading = false;
      },
      (movies) {
        if (movies.isEmpty) {
          _isLastPage = true;
        } else {
          _currentPage++;
          emit(PopularMoviesSuccess(movies));
        }
        _isLoading = false;
      },
    );
  }
}
