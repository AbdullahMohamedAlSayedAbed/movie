part of 'videos_cubit.dart';

sealed class VideosState extends Equatable {
  const VideosState();

  @override
  List<Object> get props => [];
}

final class VideosInitial extends VideosState {}

final class VideosLoading extends VideosState {}

final class VideosSuccess extends VideosState {
  final List<VideoEntity> videos;
  const VideosSuccess(this.videos);
  @override
  List<Object> get props => [videos];
}

final class VideosFailure extends VideosState {
  final String errMessage;
  const VideosFailure(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}
