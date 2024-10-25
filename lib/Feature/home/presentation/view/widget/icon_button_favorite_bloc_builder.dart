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
          return Icon(
              context.read<FavoriteCubit>().isFavorite(movie.id)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.red);
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
