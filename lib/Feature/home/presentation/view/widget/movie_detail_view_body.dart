import 'package:flutter/material.dart';
import 'package:movie/Feature/home/presentation/view/widget/all_details_movie.dart';
import 'package:movie/Feature/home/presentation/view/widget/details_actors_list_view.dart';
import 'package:movie/Feature/home/presentation/view/widget/sliver_grid_recommendation_bloc_builder.dart';
import 'package:movie/core/utils/app_styles.dart';

class MovieDetailViewBody extends StatelessWidget {
  const MovieDetailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const AllDetailsMovie(),
        const SliverToBoxAdapter(child: ActorsListView()),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
          sliver: SliverToBoxAdapter(
            child: Text("more like this".toUpperCase(),
                style: AppStyles.styles16W500),
          ),
        ),
        const SliverGridRecommendationBlocBuilder(),
      ],
    );
  }
}
