import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/favourite/presentation/controllers/favorite_cubit/favourite_cubit.dart';
import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';
import 'package:movie/core/utils/app_styles.dart';

class FavoriteDataContainer extends StatelessWidget {
  const FavoriteDataContainer({super.key, required this.movie});
  final MovieDetailsEntity movie;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 180,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          Text(
            movie.title,
            style: AppStyles.styles19W500,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 2.0,
                  horizontal: 8.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffFF7878),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  movie.releaseDate.split('-')[0],
                  style: AppStyles.styles14W400,
                ),
              ),
              const SizedBox(width: 16.0),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 20.0,
                  ),
                  const SizedBox(width: 4.0),
                  Text((movie.voteAverage / 2).toStringAsFixed(1),
                      style: AppStyles.styles16W500white70),
                ],
              ),
              const SizedBox(width: 16.0),
              IconButton(
                icon: const Icon(Icons.delete, size: 35, color: Colors.red),
                onPressed: () {
                  BlocProvider.of<FavoriteCubit>(context)
                      .removeFavorite(movie.id);
                },
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Text(
            movie.overview,
            style: AppStyles.styles16W500white70,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
