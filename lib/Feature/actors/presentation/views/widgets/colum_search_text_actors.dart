import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/actors/presentation/controllers/person_search_cubit/person_search_cubit.dart';
import 'package:movie/Feature/actors/presentation/views/widgets/actor_search_list_view_bloc_builder.dart';
import 'package:movie/Feature/search/presentation/views/widgets/custom_search_text_field.dart';

class ColumSearchTextActors extends StatelessWidget {
  const ColumSearchTextActors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSearchTextField(
          onChanged: (value) {

            context
                .read<PersonSearchCubit>()
                .getPersonsSearch(query: value.isEmpty ? 'A' : value);
          },
        ),
        const SizedBox(height: 10),

        const ActorSearchListViewBlocBuilder(),
      ],
    );
  }
}
