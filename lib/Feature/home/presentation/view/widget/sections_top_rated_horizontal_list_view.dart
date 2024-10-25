import 'package:flutter/material.dart';
import 'package:movie/Feature/home/presentation/view/top_rated_view.dart';
import 'package:movie/Feature/home/presentation/view/widget/custom_list_view_horizontal_top_rated.dart';
import 'package:movie/Feature/home/presentation/view/widget/title_list_view_and_see_more.dart';

class SectionsTopRatedHorizontalListView extends StatelessWidget {
  const SectionsTopRatedHorizontalListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleListViewAndSeeMore(
          title: 'Top Rated',
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TopRatedView()));
          },
        ),
        const SizedBox(
          height: 170.0,
          child: CustomListViewHorizontalTopRated(),
        ),
      ],
    );
  }
}
