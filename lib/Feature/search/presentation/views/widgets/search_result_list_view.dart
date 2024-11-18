import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/presentation/view/widget/popular_and_top_rated_card_movie.dart';
import 'package:movie/Feature/search/presentation/controller/search_cubit.dart';
import 'package:movie/core/utils/app_styles.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      if (state is SearchSuccess) {
        return Expanded(
          child: ListView.builder(
              itemBuilder: (context, index) {
                return PopularAndTopRatedCardMovie(
                  movie: state.moviesList[index],
                );
              },
              itemCount: state.moviesList.length),
        );
      } else if (state is SearchFailure) {
        return Center(
          child: Text(state.errMessage, style: AppStyles.errorTextStyle),
        );
      } else if (state is SearchLoading) {
        return const LinearProgressIndicator(
          color: Color(0xff1E1E29),
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
