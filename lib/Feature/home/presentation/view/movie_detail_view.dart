import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/domin/repo/home_repo.dart';
import 'package:movie/Feature/home/presentation/controller/movie_detail/movie_detail_cubit.dart';
import 'package:movie/Feature/home/presentation/controller/recommendations/recommendations_cubit.dart';
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
          create: (context) => RecommendationsCubit(getIt<HomeRepository>())
            ..getRecommendations(id),
        ),
        BlocProvider(
          create: (context) =>
              MovieDetailCubit(getIt<HomeRepository>())..getMovieDetails(id),
        ),
      ],
      child: const Scaffold(
        body: MovieDetailViewBody(),
      ),
    );
  }
}
