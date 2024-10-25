import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/domin/repo/home_repo.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit(this.homeRepository) : super(NowPlayingInitial());
  final HomeRepository homeRepository;

  Future<void> getNowPlaying() async {
    emit(NowPlayingLoading());
    final result = await homeRepository.getNowPlaying();
    result.fold(
      (failure) => emit(NowPlayingFailure(failure.message)),
      (movies) => emit(NowPlayingSuccess(movies)),
    );
  }
}
