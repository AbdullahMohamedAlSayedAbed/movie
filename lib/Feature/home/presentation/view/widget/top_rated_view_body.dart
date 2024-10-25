import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/presentation/controller/top_ated_movies/top_rated_movies_cubit.dart';
import 'package:movie/Feature/home/presentation/view/widget/custom_loading_carousel_slider.dart';
import 'package:movie/Feature/home/presentation/view/widget/popular_and_top_rated_card_movie.dart';
import 'package:movie/core/utils/app_styles.dart';

class TopRatedViewBody extends StatelessWidget {
  const TopRatedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
      return BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
        builder: (context, state) {
      if (state is TopRatedMoviesSuccess) {
        return ListView.builder(
            itemBuilder: (context, index) {
              return  PopularAndTopRatedCardMovie(movie: state.moviesList[index],);
            },
            itemCount: 15);
      } else if (state is TopRatedMoviesFailure) {
        return Center(
          child: Text(state.errMessage, style: AppStyles.errorTextStyle),
        );
      } else {
        return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              return CustomLoadingCarouselSlider(
                  heightLoading: 180,
                  widthLoading: MediaQuery.sizeOf(context).width - 16);
            },
            itemCount: 15);
      }
    });
  }
}
