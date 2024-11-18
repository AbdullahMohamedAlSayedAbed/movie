import 'package:flutter/material.dart';
import 'package:movie/Feature/home/domin/entities/actor_movies_entity.dart';
import 'package:movie/Feature/home/presentation/view/functions/navigate_movie_detail_view.dart';
import 'package:movie/Feature/home/presentation/view/widget/actor_details_movies.dart';
import 'package:movie/Feature/home/presentation/view/widget/image_popular_and_top_rated_widget.dart';
import 'package:movie/core/utils/app_color.dart';

class ActorsMoviesItem extends StatelessWidget {
  const ActorsMoviesItem({
    super.key,
    required this.movie,
  });
  final ActorMoviesEntity movie;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateMovieDetailView(context, id: movie.id);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xff303030),
          boxShadow: const [
            BoxShadow(
              color: AppColor.secondaryColor,
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(2, 4),
            ),
          ],
        ),
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImagePopularAndTopRatedWidget(image: movie.posterPath ?? ''),
            const SizedBox(width: 12),
            ActorDetailsMovies(
              movie: movie,
            )
          ],
        ),
      ),
    );
  }
}
