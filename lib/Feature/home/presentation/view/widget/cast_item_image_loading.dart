import 'package:flutter/material.dart';
import 'package:movie/core/widgets/custom_loading.dart';

class CastItemImageLoading extends StatelessWidget {
  const CastItemImageLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomLoading(
        enabled: true,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(50)),
        ));
  }
}
