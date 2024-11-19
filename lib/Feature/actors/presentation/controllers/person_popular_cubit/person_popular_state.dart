part of 'person_popular_cubit.dart';

sealed class PersonPopularState extends Equatable {
  const PersonPopularState();

  @override
  List<Object> get props => [];
}

final class PersonPopularInitial extends PersonPopularState {}

final class PersonPopularSuccess extends PersonPopularState {
  final List<PersonEntity>? personPopularList;

  const PersonPopularSuccess(this.personPopularList);
  @override
  List<Object> get props => [personPopularList?? []];
}

final class PersonPopularFailure extends PersonPopularState {
  final String errMessage;

  const PersonPopularFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}

final class PersonPopularLoading extends PersonPopularState {}
final class PersonPopularPaginationFailure extends PersonPopularState {
  final String errMessage;

  const PersonPopularPaginationFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}

final class PersonPopularPaginationLoading extends PersonPopularState {}
