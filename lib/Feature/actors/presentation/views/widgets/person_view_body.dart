import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/actors/presentation/controllers/person_popular_cubit/person_popular_cubit.dart';
import 'package:movie/Feature/actors/presentation/views/widgets/colum_search_text_actors.dart';
import 'package:movie/Feature/actors/presentation/views/widgets/sliver_grid_popular_actor.dart';
import 'package:movie/Feature/home/presentation/view/widget/custom_loading_discover_grid_view.dart';
import 'package:movie/core/utils/app_styles.dart';
import 'package:movie/core/widgets/custom_error_widget.dart';

class PersonViewBody extends StatelessWidget {
  const PersonViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const ColumSearchTextActors(),
                const SizedBox(height: 10),
                Text('Popular Actors : ', style: AppStyles.styles19W500),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        BlocBuilder<PersonPopularCubit, PersonPopularState>(
          builder: (context, state) {
            if (state is PersonPopularSuccess) {
              return SliverGridPopularActor(
                  personEntity: state.personPopularList);
            }
            if (state is PersonPopularFailure) {
              return SliverToBoxAdapter(
                child: CustomErrorWidget(errMessage: state.errMessage),
              );
            }
            return const SliverToBoxAdapter(
              child: Expanded(child: CustomLoadingDiscoverGridView()),
            );
          },
        ),
      ],
    );
  }
}
