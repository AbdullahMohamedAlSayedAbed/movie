import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/presentation/controller/top_ated_movies/top_rated_movies_cubit.dart';
import 'package:movie/Feature/home/presentation/view/widget/custom_loading_carousel_slider.dart';
import 'package:movie/Feature/home/presentation/view/widget/popular_and_top_rated_card_movie.dart';
import 'package:movie/core/utils/functions/build_show_toast_functions.dart';
import 'package:movie/core/widgets/custom_error_widget.dart';

class TopRatedViewBody extends StatefulWidget {
  const TopRatedViewBody({super.key});

  @override
  State<TopRatedViewBody> createState() => _TopRatedViewBodyState();
}

class _TopRatedViewBodyState extends State<TopRatedViewBody> {
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent * .8) {
        context.read<TopRatedMoviesCubit>().getTopRatedPaginationMovies();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<HomeEntity> moviesList = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TopRatedMoviesCubit, TopRatedMoviesState>(
        listener: (context, state) {
      if (state is TopRatedMoviesPaginationFailure) {
        buildShowToastFunction(message: state.errMessage);
      }
      if (state is TopRatedMoviesSuccess) {
        moviesList.addAll(state.moviesList);
      }
    }, builder: (context, state) {
      if (state is TopRatedMoviesSuccess ||
          state is TopRatedMoviesFailure ||
          state is TopRatedMoviesPaginationLoading) {
        return ListView.builder(
            controller: _scrollController,
            itemBuilder: (context, index) {
              return PopularAndTopRatedCardMovie(
                movie: moviesList[index],
              );
            },
            itemCount: moviesList.length);
      } else if (state is TopRatedMoviesFailure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return CustomLoadingCarouselSlider(
                    heightLoading: 180,
                    widthLoading: MediaQuery.sizeOf(context).width - 32);
              },
              itemCount: 15),
        );
      }
    });
  }
}
