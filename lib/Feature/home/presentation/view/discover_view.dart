import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';
import 'package:movie/Feature/home/presentation/controller/get_genres_cubit/get_genres_cubit.dart';
import 'package:movie/Feature/home/presentation/view/functions/build_app_bar.dart';
import 'package:movie/Feature/home/presentation/view/widget/discover_view_body.dart';
import 'package:movie/core/utils/functions/setup_service_locator.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key, required this.genreEntity});
  final GenreEntity genreEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: genreEntity.name),
      body: BlocProvider(
        create: (context) =>
            getIt<GetGenresCubit>()..getDiscoverMovies(genreEntity.id),
        child: DiscoverViewBody(id: genreEntity.id),
      ),
    );
  }
}
