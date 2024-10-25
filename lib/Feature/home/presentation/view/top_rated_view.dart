import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/domin/repo/home_repo.dart';
import 'package:movie/Feature/home/presentation/controller/top_ated_movies/top_rated_movies_cubit.dart';
import 'package:movie/Feature/home/presentation/view/functions/build_app_bar.dart';
import 'package:movie/Feature/home/presentation/view/widget/top_rated_view_body.dart';
import 'package:movie/core/utils/functions/setup_service_locator.dart';

class TopRatedView extends StatelessWidget {
  const TopRatedView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: buildAppBar(title: 'Top Rated Movies'),
        body: BlocProvider(
          create: (context) =>
              TopRatedMoviesCubit(getIt<HomeRepository>())..getTopRatedMovies(),
          child: const TopRatedViewBody(),
        ));
  }
}
