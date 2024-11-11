import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/domin/repo/home_repo.dart';

part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  TopRatedMoviesCubit(this.homeRepository) : super(TopRatedMoviesInitial());
  final HomeRepository homeRepository;
  int _currentPage = 2;
  bool _isLoading = false;
  bool _isLastPage = false;

  Future<void> getTopRatedMovies() async {
    emit(TopRatedMoviesLoading());
    final result = await homeRepository.getTopRatedMovies();
    result.fold(
      (failure) => emit(TopRatedMoviesFailure(failure.message)),
      (movies) {
        emit(TopRatedMoviesSuccess(movies));
        _currentPage = 2;
        _isLastPage = false;
      },
    );
  }

  Future<void> getTopRatedPaginationMovies() async {
    if (_isLoading || _isLastPage) return;
    _isLoading = true;
    emit(TopRatedMoviesPaginationLoading());
    final result =
        await homeRepository.getTopRatedPaginationMovies(page: _currentPage);
    result.fold(
      (failure) {
        emit(TopRatedMoviesPaginationFailure(failure.message));
        _isLoading = false;
      },
      (movies) {
        if (movies.isEmpty) {
          _isLastPage = true;
        } else {
          emit(TopRatedMoviesSuccess(movies));
          _currentPage++;
        }
        _isLoading = false;
      },
    );
  }
}
