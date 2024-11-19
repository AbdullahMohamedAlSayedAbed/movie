import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/actors/presentation/controllers/person_search_cubit/person_search_cubit.dart';
import 'package:movie/Feature/actors/presentation/views/widgets/actor_search_list_view_separated.dart';
import 'package:movie/core/widgets/custom_error_widget.dart';

class ActorSearchListViewBlocBuilder extends StatelessWidget {
  const ActorSearchListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonSearchCubit, PersonSearchState>(
      builder: (context, state) {
        if (state is PersonSearchSuccess) {
          if (state.personList.isEmpty) {
            return const CustomErrorWidget(errMessage: 'no actors found');
          }
          return ActorSearchListViewSeparated(
              personSearchList: state.personList);
        } else if (state is PersonSearchFailure) {
          print(state.errMessage);
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const LinearProgressIndicator();
        }
      },
    );
  }
}
