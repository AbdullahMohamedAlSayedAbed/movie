import 'package:flutter/material.dart';
import 'package:movie/core/widgets/custom_loading.dart';

class CustomLoadingCarouselSlider extends StatelessWidget {
  const CustomLoadingCarouselSlider({
    super.key,
    this.heightLoading,
    this.widthLoading,
  });
  final double? heightLoading;
  final double? widthLoading;
  @override
  Widget build(BuildContext context) {
    return CustomLoading(
      enabled: true,
      child: Container(
        width: widthLoading ?? double.infinity,
        height: heightLoading ?? 400,
        color: Colors.grey[300],
      ),
    );
  }
}
