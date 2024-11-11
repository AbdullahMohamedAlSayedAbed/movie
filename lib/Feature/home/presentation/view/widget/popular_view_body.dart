import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/presentation/controller/popular_movies/popular_movies_cubit.dart';
import 'package:movie/Feature/home/presentation/view/widget/custom_loading_carousel_slider.dart';
import 'package:movie/Feature/home/presentation/view/widget/popular_and_top_rated_card_movie.dart';
import 'package:movie/core/utils/functions/build_show_toast_functions.dart';
import 'package:movie/core/widgets/custom_error_widget.dart';

class PopularViewBody extends StatefulWidget {
  const PopularViewBody({super.key});

  @override
  State<PopularViewBody> createState() => _PopularViewBodyState();
}

class _PopularViewBodyState extends State<PopularViewBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent * .9) {
        context.read<PopularMoviesCubit>().getPopularPaginationMovies();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<HomeEntity> movies = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularMoviesCubit, PopularMoviesState>(
        listener: (context, state) {
      if (state is PopularMoviesPaginationFailure) {
        buildShowToastFunction(message: state.errMessage);
      }
      if (state is PopularMoviesSuccess) {
        movies.addAll(state.moviesList);
      }
    }, builder: (context, state) {
      if (state is PopularMoviesSuccess ||
          state is PopularMoviesPaginationFailure ||
          state is PopularMoviesPaginationLoading) {
        return ListView.builder(
            controller: _scrollController,
            itemBuilder: (context, index) {
              return PopularAndTopRatedCardMovie(movie: movies[index]);
            },
            itemCount: movies.length);
      } else if (state is PopularMoviesFailure) {
        return CustomErrorWidget(errMessage: state.message);
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
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
