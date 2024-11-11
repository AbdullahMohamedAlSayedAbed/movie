import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_styles.dart';

class BiographySection extends StatelessWidget {
  final String? biography;

  const BiographySection({super.key, required this.biography});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Biography',
          style: AppStyles.styles23W700,
        ),
        const SizedBox(height: 8),
        Text(
          biography == null || biography!.isEmpty
              ? 'No biography available.'
              : biography!,
          style: AppStyles.styles18W500
              .copyWith(color: Colors.white70, height: 1.6),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
