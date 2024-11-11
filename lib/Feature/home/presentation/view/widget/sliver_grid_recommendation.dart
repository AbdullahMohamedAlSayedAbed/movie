import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/Feature/home/domin/entities/recommendation_entity.dart';
import 'package:movie/Feature/home/presentation/view/functions/navigate_movie_detail_view.dart';
import 'package:movie/Feature/home/presentation/view/widget/custom_loading_carousel_slider.dart';
import 'package:movie/core/constants/api_constants.dart';

class SliverGridRecommendation extends StatelessWidget {
  const SliverGridRecommendation({
    super.key,
    required this.recommendation,
  });
  final List<RecommendationEntity> recommendation;
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return InkWell(
            onTap: () {
              navigateMovieDetailView(context, id: recommendation[index].id);
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              child: CachedNetworkImage(
                imageUrl: ApiConstants.imageUrl(ApiConstants.imageUrl(
                    recommendation[index].backdropPath ?? '')),
                placeholder: (context, url) =>
                    const CustomLoadingCarouselSlider(
                        heightLoading: 180, widthLoading: 120),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 180.0,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        childCount: recommendation.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.7,
        crossAxisCount: 3,
      ),
    );
  }
}
