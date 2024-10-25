import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/Feature/home/presentation/view/widget/custom_loading_carousel_slider.dart';
import 'package:movie/core/constants/api_constants.dart';

class ImagePopularAndTopRatedWidget extends StatelessWidget {
  const ImagePopularAndTopRatedWidget({
    super.key, required this.image, 
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: CachedNetworkImage(
        imageUrl: ApiConstants.imageUrl(ApiConstants.imageUrl(
            image)),
        placeholder: (context, url) => const CustomLoadingCarouselSlider(
            heightLoading: 170, widthLoading: 120),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        height: 170.0,
        width: 120,
        fit: BoxFit.cover,
      ),
    );
  }
}
