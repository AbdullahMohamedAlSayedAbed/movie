import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/presentation/controller/recommendations/recommendations_cubit.dart';
import 'package:movie/Feature/home/presentation/view/widget/similar_text_widget.dart';
class SimilarTextEndRecommendationWidget extends StatelessWidget {
  const SimilarTextEndRecommendationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<RecommendationsCubit>();

    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
      sliver: SliverToBoxAdapter(
        child: BlocBuilder<RecommendationsCubit, RecommendationsState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    cubit.isActiveSelected(0);
                  },
                  child: SimilarTextWidget(
                    isActive: cubit.isActive == 0,
                    text: "Episodes",
                  ),
                ),
                InkWell(
                  onTap: () {
                    cubit.isActiveSelected(1);
                  },
                  child: SimilarTextWidget(
                    isActive: cubit.isActive == 1,
                    text: "more like this",
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
