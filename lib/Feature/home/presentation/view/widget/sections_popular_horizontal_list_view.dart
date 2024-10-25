import 'package:flutter/material.dart';
import 'package:movie/Feature/home/presentation/view/widget/custom_list_view_horizontal_popular.dart';
import 'package:movie/Feature/home/presentation/view/popular_view.dart';
import 'package:movie/Feature/home/presentation/view/widget/title_list_view_and_see_more.dart';

class SectionsPopularHorizontalListView extends StatelessWidget {
  const SectionsPopularHorizontalListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleListViewAndSeeMore(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PopularView()));
          },
          title: 'Popular',
        ),
        const SizedBox(
          height: 170.0,
          child: CustomListViewHorizontalPopular(),
        ),
      ],
    );
  }
}
