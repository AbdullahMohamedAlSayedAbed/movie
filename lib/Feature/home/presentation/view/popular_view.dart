import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/presentation/controller/popular_movies/popular_movies_cubit.dart';
import 'package:movie/Feature/home/presentation/view/functions/build_app_bar.dart';
import 'package:movie/Feature/home/presentation/view/widget/popular_view_body.dart';
import 'package:movie/core/utils/functions/setup_service_locator.dart';

class PopularView extends StatelessWidget {
  const PopularView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(title: 'Popular Movies'),
        body: BlocProvider(
          create: (context) => getIt<PopularMoviesCubit>()..getPopularMovies(),
          child: const PopularViewBody(),
        ));
  }
}
