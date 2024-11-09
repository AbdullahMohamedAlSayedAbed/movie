import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/presentation/controller/popular_movies/popular_movies_cubit.dart';
import 'package:movie/Feature/home/presentation/view/widget/custom_loading_carousel_slider.dart';
import 'package:movie/Feature/home/presentation/view/widget/item_list_view_widget.dart';
import 'package:movie/core/utils/app_styles.dart';
import 'package:movie/core/widgets/custom_error_widget.dart';

class CustomListViewHorizontalPopular extends StatelessWidget {
  const CustomListViewHorizontalPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
        builder: (context, state) {
      if (state is PopularMoviesSuccess) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.moviesList.length,
          itemBuilder: (context, index) {
            return ItemListViewWidget(
              id: state.moviesList[index].id,
              image: state.moviesList[index].backdropPath!,
            );
          },
        );
      } else if (state is PopularMoviesFailure) {
        return CustomErrorWidget(errMessage: state.message);
      } else {
        return ListView.separated(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const CustomLoadingCarouselSlider(
                heightLoading: 170, widthLoading: 120);
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            width: 3,
          ),
        );
      }
    });
  }
}
