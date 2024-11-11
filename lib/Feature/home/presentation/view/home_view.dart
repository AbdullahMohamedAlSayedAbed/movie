import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/presentation/controller/get_genres_cubit/get_genres_cubit.dart';
import 'package:movie/Feature/home/presentation/controller/now_playing/now_playing_cubit.dart';
import 'package:movie/Feature/home/presentation/controller/popular_movies/popular_movies_cubit.dart';
import 'package:movie/Feature/home/presentation/controller/top_ated_movies/top_rated_movies_cubit.dart';
import 'package:movie/Feature/home/presentation/view/widget/home_view_body.dart';
import 'package:movie/core/utils/functions/setup_service_locator.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<NowPlayingCubit>()..getNowPlaying(),
        ),
        BlocProvider(
          create: (context) => getIt<PopularMoviesCubit>()..getPopularMovies(),
        ),
        BlocProvider(
          create: (context) =>
              getIt<TopRatedMoviesCubit>()..getTopRatedMovies(),
        ),
        BlocProvider(
          create: (context) =>
              getIt<GetGenresCubit>()..getGenres(),
        ),
      ],
      child: const HomeViewBody(),
    ));
  }
}
