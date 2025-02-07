import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_color.dart';
import 'package:movie/core/utils/app_styles.dart';

class GenresItemWidget extends StatefulWidget {
  const GenresItemWidget({super.key, required this.title});
  final String title;
  @override
  State<GenresItemWidget> createState() => _GenresItemWidgetState();
}

class _GenresItemWidgetState extends State<GenresItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _scaleAnimation;
  int index = 0;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: AppColor.primaryColor,
      end: Colors.red,
    ).animate(_controller);
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.03,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            constraints: const BoxConstraints(minWidth: 200, maxWidth: 230),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 12.0,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _colorAnimation.value!,
                  AppColor.secondaryColor.withValues(alpha: 0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: _colorAnimation.value!.withValues(alpha: 0.4),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: const Offset(2, 4),
                ),
              ],
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: AppStyles.styles23W700,
            ),
          ),
        );
      },
    );
  }
}
