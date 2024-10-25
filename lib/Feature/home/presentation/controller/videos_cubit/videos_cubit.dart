import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/Feature/home/domin/entities/video_entity.dart';
import 'package:movie/Feature/home/domin/repo/home_repo.dart';

part 'videos_state.dart';

class VideosCubit extends Cubit<VideosState> {
  VideosCubit(this.homeRepository) : super(VideosInitial());
  final HomeRepository homeRepository;

  Future<void> getVideos(int movieId) async {
    emit(VideosLoading());
    final result = await homeRepository.getVideos(movieId);
    result.fold(
      (failure) => emit(VideosFailure(failure.message)),
      (videos) => emit(VideosSuccess(videos)),
    );
  }
}
