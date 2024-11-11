import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';
import 'package:movie/Feature/home/domin/repo/home_repo.dart';

part 'get_genres_state.dart';

class GetGenresCubit extends Cubit<GetGenresState> {
  GetGenresCubit(this.homeRepository) : super(GetGenresInitial());
  final HomeRepository homeRepository;
  Future<void> getGenres() async {
    emit(GetGenresLoading());
    final result = await homeRepository.getGenres();
    result.fold(
      (l) => emit(GetGenresFailure(l.message)),
      (r) => emit(GetGenresSuccess(r)),
    );
  }
  int _currentPage = 1;
  bool _isLoading = false;
  bool _isLastPage = false;

  Future<void> getDiscoverMovies(int genreId) async {
    if (_isLoading || _isLastPage) return;
    _isLoading = true;
    if (_currentPage == 1) {
      emit(GetDiscoverLoading());
    } else {
      emit(GetDiscoverPaginationLoading());
    }

    final result =
        await homeRepository.getDiscoverMovies(id: genreId, page: _currentPage);

    result.fold(
      (failure) {
        if (_currentPage == 1) {
          emit(GetDiscoverFailure(failure.message));
        } else {
          emit(GetDiscoverPaginationFailure(failure.message));
        }
      },
      (movies) {
        if (movies.isEmpty) {
          _isLastPage = true;
        } else {
          _currentPage++; 
          emit(GetDiscoverSuccess(movies));
        }
      },
    );
    _isLoading = false;
  }

}
