import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/presentation/controller/actor_movies_cubit/actor_movies_cubit.dart';
import 'package:movie/Feature/home/presentation/controller/casts_cubit/casts_cubit.dart';
import 'package:movie/Feature/home/presentation/view/functions/build_app_bar.dart';
import 'package:movie/Feature/home/presentation/view/widget/actor_info_view_body.dart';
import 'package:movie/core/utils/functions/setup_service_locator.dart';

class ActorInfoView extends StatelessWidget {
  const ActorInfoView({super.key, required this.id, required this.name});
  final int id;
  final String name;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CastsCubit>()..getActorInfo(id),
        ),
        BlocProvider(
          create: (context) => getIt<ActorMoviesCubit>()..getActorMovies(id),
        ),
      ],
      child: Scaffold(
        appBar: buildAppBar(title: name),
        body: SafeArea(child: ActorInfoViewBody(id: id)),
      ),
    );
  }
}
