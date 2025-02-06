import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/actors/presentation/controllers/person_popular_cubit/person_popular_cubit.dart';
import 'package:movie/Feature/actors/presentation/views/widgets/colum_search_text_actors.dart';
import 'package:movie/Feature/actors/presentation/views/widgets/person_grid_view_b_loc_consumer.dart';
import 'package:movie/core/utils/app_styles.dart';

class PersonViewBody extends StatelessWidget {
  const PersonViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification.metrics.pixels >=
              notification.metrics.maxScrollExtent - 400) {
            context.read<PersonPopularCubit>().fetchMorePersons();
          }
          return false;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
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
              const PersonGridViewBLocConsumer(),
            ],
          ),
        ));
  }
}
