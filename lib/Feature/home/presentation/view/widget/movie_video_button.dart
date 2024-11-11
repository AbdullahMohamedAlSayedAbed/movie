import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_color.dart';

class MovieVideoButton extends StatefulWidget {
  const MovieVideoButton({super.key});

  @override
  _MovieVideoButtonState createState() => _MovieVideoButtonState();
}

class _MovieVideoButtonState extends State<MovieVideoButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.4).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _colorAnimation =
        ColorTween(begin: Colors.red, end: AppColor.primaryColor).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
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
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: CircleAvatar(
            radius: 28,
            backgroundColor: _colorAnimation.value,
            child: const Icon(
              Icons.play_arrow_sharp,
              color: Colors.white,
              size: 50,
            ),
          ),
        );
      },
    );
  }
}
