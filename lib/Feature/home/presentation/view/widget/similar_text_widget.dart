import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_styles.dart';

class SimilarTextWidget extends StatelessWidget {
  const SimilarTextWidget({
    super.key,
    required this.isActive,
    required this.text,
  });

  final bool isActive;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 400),
      style: isActive ? AppStyles.styles18W500 : AppStyles.styles16W500,
      child: Text(
        text.toUpperCase(),
      ),
    );
  }
}
