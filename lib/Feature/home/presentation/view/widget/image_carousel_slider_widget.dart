import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/Feature/home/presentation/view/widget/custom_loading_carousel_slider.dart';
import 'package:movie/core/constants/api_constants.dart';

class ImageCarouselSliderWidget extends StatelessWidget {
  const ImageCarouselSliderWidget(
      {super.key,
      required this.image,
      this.height,
      this.heightLoading,
      this.width,
      this.widthLoading});
  final String image;
  final double? height;
  final double? heightLoading;
  final double? width;
  final double? widthLoading;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      width: width ?? double.infinity,
      height: height ?? 560,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CustomLoadingCarouselSlider(
        heightLoading: heightLoading,
        widthLoading: widthLoading,
      ),
      imageUrl: ApiConstants.imageUrl(image),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
