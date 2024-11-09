import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/Feature/home/domin/entities/cast_entity.dart';
import 'package:movie/Feature/home/domin/repo/home_repo.dart';

part 'casts_state.dart';

class CastsCubit extends Cubit<CastsState> {
  CastsCubit(this.homeRepository) : super(CastsInitial());
    final HomeRepository homeRepository;

  Future<void> getCasts(int movieId) async {
    emit(CastsLoading());
    final result = await homeRepository.getCast(movieId);
    result.fold(
      (failure) => emit(CastsFailure(failure.message)),
      (movieDetails) => emit(CastsSuccess(movieDetails)),
    );
  }
}
