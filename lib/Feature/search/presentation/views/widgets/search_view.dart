import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/presentation/view/widget/popular_and_top_rated_card_movie.dart';
import 'package:movie/Feature/search/presentation/controller/search_cubit.dart';
import 'package:movie/Feature/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:movie/core/utils/app_styles.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomSearchTextField(
              onChanged: (value) {
                context.read<SearchCubit>().getMoviesSearch(value);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Search Result',
              style: AppStyles.styles19W500,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SearchResultListView(),
        ],
      ),
    );
  }
}

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
