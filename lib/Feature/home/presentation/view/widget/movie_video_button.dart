import 'package:flutter/material.dart';

class MovieVideoButton extends StatelessWidget {
  const MovieVideoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 28,
      backgroundColor: Colors.red,
      child: Icon(
        Icons.play_arrow_sharp,
        color: Colors.white,
        size: 50,
      ),
    );
  }
}
