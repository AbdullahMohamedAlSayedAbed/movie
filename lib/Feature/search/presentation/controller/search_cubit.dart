import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/search/data/repo_impl/search_repo_impl.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepoImpl) : super(SearchInitial());
  final SearchRepoImpl searchRepoImpl;

  Future<void> getMoviesSearch(String query) async {
    emit(SearchLoading());
    final result = await searchRepoImpl.getMoviesSearch(query);
    result.fold((failure) {
      emit(SearchFailure(failure.message));
    }, (search) {
      emit(SearchSuccess(search));
    });
  }
}
