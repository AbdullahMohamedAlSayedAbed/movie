import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/Feature/home/presentation/view/widget/custom_loading_carousel_slider.dart';
import 'package:movie/Feature/home/presentation/view/widget/movie_vide_widget.dart';
import 'package:movie/core/constants/api_constants.dart';

class CustomImageDetails extends StatelessWidget {
  const CustomImageDetails({
    super.key,
    required this.imageUrl, required this.id,
  });
  final String imageUrl;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black,
                Colors.black,
                Colors.transparent,
              ],
              stops: [0.0, 0.5, 1.0, 1.0],
            ).createShader(
              Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
            );
          },
          blendMode: BlendMode.dstIn,
          child: CachedNetworkImage(
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CustomLoadingCarouselSlider(
              heightLoading: MediaQuery.sizeOf(context).height * .3,
              widthLoading: MediaQuery.sizeOf(context).width,
            ),
            width: MediaQuery.sizeOf(context).width,
            imageUrl: ApiConstants.imageUrl(imageUrl),
            // ضع هنا رابط صورتك
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: MovieVideWidget(movieId: id)),
      ],
    );
  }
}
