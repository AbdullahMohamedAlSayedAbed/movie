import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/presentation/controller/actor_movies_cubit/actor_movies_cubit.dart';
import 'package:movie/Feature/home/presentation/view/widget/actor_profile_screen.dart';
import 'package:movie/Feature/home/presentation/view/widget/actors_movies_item.dart';
import 'package:movie/core/widgets/custom_error_widget.dart';

class ActorsMoviesSections extends StatelessWidget {
  const ActorsMoviesSections({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActorMoviesCubit, ActorMoviesState>(
        builder: (context, state) {
      if (state is ActorMoviesSuccess) {
        return SliverList.builder(
          itemCount: state.actorMovies.length,
          itemBuilder: (context, index) {
            return ActorsMoviesItem(
              movie: state.actorMovies[index],
            );
          },
        );
      } else if (state is ActorMoviesFailure) {
        return SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomErrorWidget(errMessage: state.errMessage),
        ));
      } else {
        return const SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(child: CircularProgressIndicator()),
        ));
      }
    });
  }
}
