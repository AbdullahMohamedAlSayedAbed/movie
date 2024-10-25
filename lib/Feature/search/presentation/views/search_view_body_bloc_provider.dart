import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/search/presentation/controller/search_cubit.dart';
import 'package:movie/Feature/search/presentation/views/widgets/search_view.dart';
import 'package:movie/core/utils/functions/setup_service_locator.dart';

class SearchViewBodyBlocProvider extends StatelessWidget {
  const SearchViewBodyBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchCubit>(),
      child: const SearchViewBody(),
    );
  }
}
