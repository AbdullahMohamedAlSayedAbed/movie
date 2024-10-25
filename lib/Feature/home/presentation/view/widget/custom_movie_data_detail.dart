
import 'package:flutter/material.dart';
import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';
import 'package:movie/core/utils/app_styles.dart';
import 'package:movie/core/utils/functions/show_genres_and_duration.dart';

class CustomMovieDataDetail extends StatelessWidget {
  const CustomMovieDataDetail({
    super.key,
    required this.movie,
  });
  final MovieDetailsEntity movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(movie.title, style: AppStyles.styles23W700),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 2.0,
                  horizontal: 8.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  movie.releaseDate.split('-')[0],
                  style: AppStyles.styles16W500,
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
                  const SizedBox(width: 4.0),
                  Text(
                    '${movie.voteAverage}',
                    style: AppStyles.styles2W500,
                  ),
                ],
              ),
              const SizedBox(width: 16.0),
              Text(showDuration(movie.runtime),
                  style: AppStyles.styles16W500white70)
            ],
          ),
          const SizedBox(height: 20.0),
          Text(movie.overview, style: AppStyles.styles14W400),
          const SizedBox(height: 8.0),
          Text(
            'Genres: ${showGenres(movie.genres)}',
            style: AppStyles.styles12W500,
          ),
        ],
      ),
    );
  }
}
