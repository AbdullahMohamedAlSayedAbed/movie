import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/favourite/presentation/controllers/favorite_cubit/favourite_cubit.dart';
import 'package:movie/Feature/favourite/presentation/views/widgets/favorites_view_body.dart';
import 'package:movie/core/utils/functions/setup_service_locator.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<FavoriteCubit>()..getFavorites(),
      child: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 30, bottom: 8),
          child: FavoritesViewBody(),
        ),
      ),
    );
  }
}
