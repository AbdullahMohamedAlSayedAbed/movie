part of 'get_genres_cubit.dart';

sealed class GetGenresState extends Equatable {
  const GetGenresState();

  @override
  List<Object> get props => [];
}

final class GetGenresInitial extends GetGenresState {}
final class GetGenresLoading extends GetGenresState {}
final class GetGenresSuccess extends GetGenresState {
  final List<GenreEntity> genresList;
  const GetGenresSuccess(this.genresList);

  @override
  List<Object> get props => [genresList];
}
final class GetGenresFailure extends GetGenresState {
  final String errorMessage;
  const GetGenresFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
final class GetDiscoverLoading extends GetGenresState {}
final class GetDiscoverPaginationLoading extends GetGenresState {}
final class GetDiscoverSuccess extends GetGenresState {
  final List<HomeEntity> discoverMovies;
  const GetDiscoverSuccess(this.discoverMovies);

  @override
  List<Object> get props => [discoverMovies];
}
final class GetDiscoverFailure extends GetGenresState {
  final String errMessage;
  const GetDiscoverFailure(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}
final class GetDiscoverPaginationFailure extends GetGenresState {
  final String errMessage;
  const GetDiscoverPaginationFailure(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}
