part of 'now_playing_cubit.dart';

sealed class NowPlayingState extends Equatable {
  const NowPlayingState();

  @override
  List<Object> get props => [];
}

final class NowPlayingInitial extends NowPlayingState {}

final class NowPlayingLoading extends NowPlayingState {}

final class NowPlayingSuccess extends NowPlayingState {
  final List<HomeEntity> movies;
  const NowPlayingSuccess(this.movies);
  @override
  List<Object> get props => [movies];
}

final class NowPlayingFailure extends NowPlayingState {
  final String errMessage;
  const NowPlayingFailure(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}
