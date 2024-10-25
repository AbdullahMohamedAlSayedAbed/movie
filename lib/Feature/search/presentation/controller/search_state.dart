part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<HomeEntity> moviesList;

  const SearchSuccess(this.moviesList);

  @override
  List<Object> get props => [moviesList];
}

final class SearchFailure extends SearchState {
  final String errMessage;

  const SearchFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}

final class SearchLoading extends SearchState {}
