import 'package:flutter/material.dart';

class DiscoverLoadingWidget extends StatelessWidget {
  const DiscoverLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 2 / 3,
            child: Container(
              color: Colors.grey.withOpacity(.7), 
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 30,
            color: Colors.grey.withOpacity(.7), 
          ),
        ],
      ),
    );
  }
}
