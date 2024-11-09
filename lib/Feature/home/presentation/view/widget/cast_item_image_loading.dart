import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CastItemImageLoading extends StatelessWidget {
  const CastItemImageLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Skeletonizer(enabled: true, child: CircleAvatar(radius: 50));
  }
}
