import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';
import 'package:movie/Feature/home/domin/repo/home_repo.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit(this.homeRepository) : super(MovieDetailInitial());
   final HomeRepository homeRepository;

  Future<void> getMovieDetails(int movieId) async {
    emit(MovieDetailLoading());
    final result = await homeRepository.getMovieDetails(movieId);
    result.fold(
      (failure) => emit(MovieDetailFailure(failure.message)),
      (movieDetails) => emit(MovieDetailSuccess(movieDetails)),
    );
  }
}
