import 'package:flutter/material.dart';
import 'package:movie/Feature/home/presentation/view/widget/all_details_movie.dart';
import 'package:movie/Feature/home/presentation/view/widget/similar_text_end_recommendation_widget.dart';
import 'package:movie/Feature/home/presentation/view/widget/sliver_grid_recommendation_bloc_builder.dart';


class MovieDetailViewBody extends StatelessWidget {
  const MovieDetailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        AllDetailsMovie(),
        SimilarTextEndRecommendationWidget(),
        SliverGridRecommendationBlocBuilder(),
      ],
    );
  }
}
