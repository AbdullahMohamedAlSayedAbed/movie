import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/presentation/controller/top_ated_movies/top_rated_movies_cubit.dart';
import 'package:movie/Feature/home/presentation/view/widget/custom_loading_carousel_slider.dart';
import 'package:movie/Feature/home/presentation/view/widget/item_list_view_widget.dart';
import 'package:movie/core/utils/app_styles.dart';

class CustomListViewHorizontalTopRated extends StatelessWidget {
  const CustomListViewHorizontalTopRated({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
        builder: (context, state) {
      if (state is TopRatedMoviesSuccess) {
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
      } else if (state is TopRatedMoviesFailure) {
        return Center(
          child: Text(state.errMessage, style: AppStyles.errorTextStyle,
          softWrap: true,),
        );
      } else {
        return SizedBox(
          height: 170,
          child: ListView.separated(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const CustomLoadingCarouselSlider(
                  heightLoading: 170, widthLoading: 120);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              width: 4,
            ),
          ),
        );
      }
    });
  }
}
