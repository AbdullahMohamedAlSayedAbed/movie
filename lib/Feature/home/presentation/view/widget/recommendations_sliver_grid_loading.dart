import 'package:flutter/material.dart';
import 'package:movie/Feature/home/presentation/view/widget/custom_loading_carousel_slider.dart';

class RecommendationsSliverGridLoading extends StatelessWidget {
  const RecommendationsSliverGridLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(childCount: 20, (context, index) {
        return const CustomLoadingCarouselSlider(
            heightLoading: 170, widthLoading: 120);
      }),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.7,
        crossAxisCount: 3,
      ),
    );
  }
}
