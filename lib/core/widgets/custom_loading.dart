import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key, required this.child, this.enabled = false});
  final Widget child;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(enabled: enabled, child: child);
  }
}
