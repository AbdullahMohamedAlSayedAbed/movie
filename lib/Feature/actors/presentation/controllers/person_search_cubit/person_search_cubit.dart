import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/Feature/actors/domin/entities/person_entity.dart';
import 'package:movie/Feature/actors/domin/repo/person_repo.dart';

part 'person_search_state.dart';

class PersonSearchCubit extends Cubit<PersonSearchState> {
  PersonSearchCubit(this.personRepo) : super(PersonSearchInitial());
  final PersonRepo personRepo;

  Future<void> getPersonsSearch({required String query}) async {
    emit(PersonSearchLoading());
    final result = await personRepo.getPersonsSearch(query: query);
    result.fold((failure) => emit(PersonSearchFailure(failure.message)),
        (actors) => emit(PersonSearchSuccess(actors)));
  }
}
