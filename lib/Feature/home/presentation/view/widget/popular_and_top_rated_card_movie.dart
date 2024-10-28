import 'package:flutter/material.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/presentation/view/functions/navigate_movie_detail_view.dart';
import 'package:movie/Feature/home/presentation/view/widget/image_popular_and_top_rated_widget.dart';
import 'package:movie/Feature/home/presentation/view/widget/popular_and_top_rated_details_movie.dart';
import 'package:movie/core/utils/app_color.dart';

class PopularAndTopRatedCardMovie extends StatelessWidget {
  const PopularAndTopRatedCardMovie({
    super.key,
    required this.movie,
  });
  final HomeEntity movie;
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
            ImagePopularAndTopRatedWidget(image: movie.backdropPath ?? ''),
            const SizedBox(width: 12),
            PopularAndTopRatedDetailsMovie(
              movie: movie,
            )
          ],
        ),
      ),
    );
  }
}
