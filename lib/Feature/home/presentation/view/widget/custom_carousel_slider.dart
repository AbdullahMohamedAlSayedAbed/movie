import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/presentation/controller/now_playing/now_playing_cubit.dart';
import 'package:movie/Feature/home/presentation/view/functions/navigate_movie_detail_view.dart';
import 'package:movie/Feature/home/presentation/view/widget/custom_loading_carousel_slider.dart';
import 'package:movie/Feature/home/presentation/view/widget/stack_carousel_slider_widget.dart';
import 'package:movie/core/widgets/custom_error_widget.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingCubit, NowPlayingState>(
      builder: (context, state) {
        if (state is NowPlayingSuccess) {
          return CarouselSlider(
            items: List.generate(state.movies.length, (index) {
              return InkWell(
                  onTap: () {
                    navigateMovieDetailView(context,
                        id: state.movies[index].id);
                  },
                  child: StackCarouselSliderWidget(movie: state.movies[index]));
            }),
            options: CarouselOptions(
              height: 400.0,
              initialPage: 0,
              reverse: false,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          );
        } else if (state is NowPlayingFailure) {
          return SizedBox(
              height: 400,
              child: CustomErrorWidget(errMessage: state.errMessage));
        }
        return const CustomLoadingCarouselSlider();
      },
    );
  }
}
