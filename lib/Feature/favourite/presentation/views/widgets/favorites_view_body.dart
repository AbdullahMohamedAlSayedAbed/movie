import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/favourite/presentation/controllers/favorite_cubit/favourite_cubit.dart';
import 'package:movie/Feature/favourite/presentation/views/widgets/favorite_item.dart';
import 'package:movie/core/utils/app_styles.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoritesSuccess) {
          final movies = state.movies;
          if (movies.isEmpty) {
            return const Center(
                child: Text(
              'there is no favorite movies',
              style: AppStyles.styles24,
            ));
          }
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return FavoriteItem(movie: movie);
            },
          );
        } else if (state is FavoriteInitial) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Center(
              child: Text(
            'Something went wrong',
            style: AppStyles.errorTextStyle,
          ));
        }
      },
    );
  }
}
