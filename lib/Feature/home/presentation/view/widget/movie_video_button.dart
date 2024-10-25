import 'package:flutter/material.dart';

class MovieVideoButton extends StatelessWidget {
  const MovieVideoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 10,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: Colors.red,
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(
            Icons.play_arrow_sharp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
