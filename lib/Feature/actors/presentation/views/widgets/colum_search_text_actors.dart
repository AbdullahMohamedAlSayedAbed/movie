import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/actors/presentation/controllers/person_search_cubit/person_search_cubit.dart';
import 'package:movie/Feature/actors/presentation/views/widgets/actor_search_list_view_bloc_builder.dart';
import 'package:movie/Feature/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:movie/core/widgets/custom_error_widget.dart';

class ColumSearchTextActors extends StatefulWidget {
  const ColumSearchTextActors({
    super.key,
  });

  @override
  State<ColumSearchTextActors> createState() => _ColumSearchTextActorsState();
}

class _ColumSearchTextActorsState extends State<ColumSearchTextActors> {
  
  String query = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSearchTextField(
          onChanged: (value) {
            query = value;
            setState(() {
              
            });
            context
                .read<PersonSearchCubit>()
                .getPersonsSearch(query: value);
          },
        ),
        const SizedBox(height: 10),
        query.isEmpty
            ? const CustomErrorWidget(errMessage: 'Enter a text to search')
            : const ActorSearchListViewBlocBuilder(),
      ],
    );
  }
}
