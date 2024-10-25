import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/presentation/controller/recommendations/recommendations_cubit.dart';
import 'package:movie/Feature/home/presentation/view/widget/recommendations_sliver_grid_loading.dart';
import 'package:movie/Feature/home/presentation/view/widget/sliver_grid_recommendation.dart';


class SliverGridRecommendationBlocBuilder extends StatelessWidget {
  const SliverGridRecommendationBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationsCubit, RecommendationsState>(
      builder: (context, state) {
        if (state is RecommendationsSuccess) {
          return SliverPadding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
            sliver: SliverGridRecommendation(
              recommendation: state.recommendations,
            ),
          );
        } else if (state is RecommendationsFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errMessage)),
          );
        } else {
          return const RecommendationsSliverGridLoading();
        }
      },
    );
  }
}
