import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/favourite/presentation/controllers/favorite_cubit/favourite_cubit.dart';
import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';



class IconButtonFavoriteBlocBuilder extends StatelessWidget {
  const IconButtonFavoriteBlocBuilder({
    super.key,
    required this.movie,
  });

  final MovieDetailsEntity movie;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          final isFavorite = context.read<FavoriteCubit>().isFavorite(movie.id);
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (child, animation) {
              if (child.key == ValueKey<bool>(true)) {
                // Transition when adding to favorite
                return ScaleTransition(scale: animation, child: child);
              } else {
                // Transition when removing from favorite
                return RotationTransition(
                  turns: animation,
                  child: child,
                );
              }
            },
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              key: ValueKey<bool>(isFavorite),
              color: Colors.red,
            ),
          );
        },
      ),
      onPressed: () {
        final cubit = context.read<FavoriteCubit>();
        cubit.isFavorite(movie.id)
            ? cubit.removeFavorite(movie.id)
            : cubit.addFavorite(movie);
      },
    );
  }
}
