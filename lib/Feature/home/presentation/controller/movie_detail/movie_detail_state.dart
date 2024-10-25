part of 'movie_detail_cubit.dart';

sealed class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

final class MovieDetailInitial extends MovieDetailState {}
final class MovieDetailLoading extends MovieDetailState {}
final class MovieDetailSuccess extends MovieDetailState {
  final MovieDetailsEntity movieDetail;
  const MovieDetailSuccess(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}
final class MovieDetailFailure extends MovieDetailState {
  final String errMessage;
  const MovieDetailFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
