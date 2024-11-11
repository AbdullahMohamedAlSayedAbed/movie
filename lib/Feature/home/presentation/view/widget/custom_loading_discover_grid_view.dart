import 'package:flutter/material.dart';
import 'package:movie/Feature/home/presentation/view/widget/discover_loading_widget.dart';
import 'package:movie/core/widgets/custom_loading.dart';

class CustomLoadingDiscoverGridView extends StatelessWidget {
  const CustomLoadingDiscoverGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2 / 4,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: 9, // عدد مؤقت للعناصر أثناء التحميل
      itemBuilder: (context, index) {
        return const CustomLoading(
          enabled: true,
          child: DiscoverLoadingWidget(), // widget خاص بـ Skeleton
        );
      },
    );
  }
}
