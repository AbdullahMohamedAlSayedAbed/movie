import 'package:flutter/material.dart';
import 'package:movie/core/widgets/custom_loading.dart';

class CastItemImageLoading extends StatelessWidget {
  const CastItemImageLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomLoading(enabled: true, child: CircleAvatar(radius: 50));
  }
}
