import 'package:flutter/material.dart';
import 'package:movie/Feature/favourite/presentation/views/widgets/favorite_data_container.dart';
import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';
import 'package:movie/Feature/home/presentation/view/functions/navigate_movie_detail_view.dart';
import 'package:movie/Feature/home/presentation/view/widget/image_popular_and_top_rated_widget.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    super.key,
    required this.movie,
  });

  final MovieDetailsEntity movie;

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
              color: Color(0x446200ee),
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
            ImagePopularAndTopRatedWidget(image: movie.backdropPath),
            const SizedBox(width: 12),
            FavoriteDataContainer(
              movie: movie,
            )
          ],
        ),
      ),
    );
  }
}
