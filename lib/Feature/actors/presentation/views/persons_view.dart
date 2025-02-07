import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/actors/presentation/controllers/person_popular_cubit/person_popular_cubit.dart';
import 'package:movie/Feature/actors/presentation/controllers/person_search_cubit/person_search_cubit.dart';
import 'package:movie/Feature/actors/presentation/views/widgets/person_view_body.dart';
import 'package:movie/core/utils/functions/setup_service_locator.dart';

class PersonsView extends StatelessWidget {
  const PersonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<PersonSearchCubit>()..getPersonsSearch(query: 'A'),
        ),
        BlocProvider(
          create: (context) => getIt<PersonPopularCubit>()..getPersonPopular(),
        ),
      ],
      child: const SafeArea(
        child: PersonViewBody(),
      ),
    );
  }
}
