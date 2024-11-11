import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Feature/home/presentation/controller/get_genres_cubit/get_genres_cubit.dart';
import 'package:movie/Feature/home/presentation/view/widget/genres_list_view_separated.dart';
import 'package:movie/core/widgets/custom_error_widget.dart';

class GenresListViewSeparatedBlocBuilder extends StatelessWidget {
  const GenresListViewSeparatedBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetGenresCubit, GetGenresState>(
      builder: (context, state) {
        if (state is GetGenresSuccess) {
          return GenresListViewSeparated(genreEntity: state.genresList);
        } else if (state is GetGenresFailure) {
          return CustomErrorWidget(errMessage: state.errorMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
