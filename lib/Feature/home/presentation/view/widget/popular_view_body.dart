import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/presentation/controller/popular_movies/popular_movies_cubit.dart';
import 'package:movie/Feature/home/presentation/view/widget/custom_loading_carousel_slider.dart';
import 'package:movie/Feature/home/presentation/view/widget/popular_and_top_rated_card_movie.dart';
import 'package:movie/core/utils/app_styles.dart';

class PopularViewBody extends StatelessWidget {
  const PopularViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
        builder: (context, state) {
      if (state is PopularMoviesSuccess) {
        return ListView.builder(
            itemBuilder: (context, index) {
              return  PopularAndTopRatedCardMovie(movie: state.moviesList[index],);
            },
            itemCount: 15);
      } else if (state is PopularMoviesFailure) {
        return Center(
          child: Text(state.message, style: AppStyles.errorTextStyle),
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
