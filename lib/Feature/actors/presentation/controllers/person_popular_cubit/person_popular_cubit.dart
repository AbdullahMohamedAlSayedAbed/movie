import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/Feature/actors/domin/entities/person_entity.dart';
import 'package:movie/Feature/actors/domin/repo/person_repo.dart';

part 'person_popular_state.dart';

class PersonPopularCubit extends Cubit<PersonPopularState> {
  PersonPopularCubit(this.personRepo) : super(PersonPopularInitial());
  final PersonRepo personRepo;
  Future<void> getPersonPopular(int page) async {
    emit(PersonPopularLoading());
    final result = await personRepo.getPersonPopular(page);
    result.fold((failure) => emit(PersonPopularFailure(failure.message)),
        (actors) => emit(PersonPopularSuccess(actors)));
  }
}
