import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/Feature/home/domin/entities/recommendation_entity.dart';
import 'package:movie/Feature/home/domin/repo/home_repo.dart';

part 'recommendations_state.dart';

class RecommendationsCubit extends Cubit<RecommendationsState> {
  RecommendationsCubit(this.homeRepository) : super(RecommendationsInitial());
  final HomeRepository homeRepository;

  Future<void> getRecommendations(int movieId) async {
    emit(RecommendationsLoading());
    final result = await homeRepository.getMovieRecommendations(movieId);
    result.fold(
      (failure) => emit(RecommendationsFailure(failure.message)),
      (recommendations) => emit(RecommendationsSuccess(recommendations)),
    );
  }

  int isActive = 0;
  void isActiveSelected(int index) {
    isActive = index;
    emit(IsActiveSelected(index));
  }
}
