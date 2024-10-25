import 'package:flutter/material.dart';
import 'package:movie/Feature/home/presentation/view/widget/custom_carousel_slider.dart';
import 'package:movie/Feature/home/presentation/view/widget/sections_popular_horizontal_list_view.dart';
import 'package:movie/Feature/home/presentation/view/widget/sections_top_rated_horizontal_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomCarouselSlider(),
          SectionsPopularHorizontalListView(),
          SectionsTopRatedHorizontalListView(),
          SizedBox(
            height: 24,
          )
        ],
      ),
    );
  }
}
