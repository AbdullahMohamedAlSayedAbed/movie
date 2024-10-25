import 'package:flutter/material.dart';
import 'package:movie/Feature/home/domin/entities/home_entity.dart';
import 'package:movie/Feature/home/presentation/view/widget/image_carousel_slider_widget.dart';

import '../../../../../core/utils/app_styles.dart';

class StackCarouselSliderWidget extends StatelessWidget {
  const StackCarouselSliderWidget({super.key, required this.movie});
  final HomeEntity movie;
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
                  // fromLTRB
                  Colors.transparent,
                  Colors.black,
                  Colors.black,
                  Colors.transparent,
                ],
                stops: [0, 0.3, 0.5, 1],
              ).createShader(
                Rect.fromLTRB(0, 0, rect.width, rect.height),
              );
            },
            blendMode: BlendMode.dstIn,
            child: ImageCarouselSliderWidget(image: movie.backdropPath!)),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.circle,
                      color: Colors.redAccent,
                      size: 16.0,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      'Now Playing'.toUpperCase(),
                      style: AppStyles.styles16W500
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  style: AppStyles.styles24
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
