part of 'person_search_cubit.dart';

sealed class PersonSearchState extends Equatable {
  const PersonSearchState();

  @override
  List<Object> get props => [];
}

final class PersonSearchInitial extends PersonSearchState {}
final class PersonSearchLoading extends PersonSearchState {}
final class PersonSearchSuccess extends PersonSearchState {
  final List<PersonEntity> personList;
  const PersonSearchSuccess(this.personList);
  @override
  List<Object> get props => [personList];
}
final class PersonSearchFailure extends PersonSearchState {
  final String errMessage;
  const PersonSearchFailure(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}
