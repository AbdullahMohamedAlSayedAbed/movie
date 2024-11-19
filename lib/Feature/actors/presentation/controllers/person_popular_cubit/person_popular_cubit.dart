import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/Feature/actors/domin/entities/person_entity.dart';
import 'package:movie/Feature/actors/domin/repo/person_repo.dart';

part 'person_popular_state.dart';

class PersonPopularCubit extends Cubit<PersonPopularState> {
  PersonPopularCubit(this.personRepo) : super(PersonPopularInitial());
  final PersonRepo personRepo;
int currentPage = 1; 
  bool isLoading = false;
  bool hasMore = true; 
  Future<void> getPersonPopular() async {
    emit(PersonPopularLoading());
    final result = await personRepo.getPersonPopular();
    result.fold((failure) => emit(PersonPopularFailure(failure.message)),
        (actors) => emit(PersonPopularSuccess(actors)));
  }

Future<void> fetchMorePersons() async {
    if (!hasMore || isLoading) return;

    isLoading = true;
    emit(PersonPopularPaginationLoading());
    final result =
        await personRepo.getPersonPopularAndPagination(++currentPage);

    result.fold(
      (failure) {
        emit(PersonPopularPaginationFailure(failure.message));
        isLoading = false;
      },
      (newPersons) {
        if (newPersons.isEmpty) {
          hasMore = false;
        } else {
          currentPage++;
          emit(PersonPopularSuccess(newPersons));
        }
        isLoading = false;
      },
    );
  }
}
