import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/favourite/presentation/controllers/favorite_cubit/favourite_cubit.dart';
import 'package:movie/Feature/home/presentation/controller/movie_detail/movie_detail_cubit.dart';
import 'package:movie/Feature/home/presentation/controller/recommendations/recommendations_cubit.dart';
import 'package:movie/Feature/home/presentation/controller/videos_cubit/videos_cubit.dart';
import 'package:movie/Feature/home/presentation/view/widget/movie_detail_view_body.dart';
import 'package:movie/core/utils/functions/setup_service_locator.dart';

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<RecommendationsCubit>()..getRecommendations(id)
        ),
        BlocProvider(
          create: (context) =>
              getIt<MovieDetailCubit>()..getMovieDetails(id),
        ),
        BlocProvider(
          create: (context) =>
              getIt<VideosCubit>()..getVideos(id),
        ),
        BlocProvider(
          create: (context) =>
              getIt<FavoriteCubit>(),
        ),
      ],
      child: const Scaffold(
        body: MovieDetailViewBody(),
      ),
    );
  }
}
