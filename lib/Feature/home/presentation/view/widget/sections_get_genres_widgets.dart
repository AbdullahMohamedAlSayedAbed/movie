import 'package:flutter/material.dart';
import 'package:movie/Feature/home/presentation/view/widget/genres_list_view_separated_bloc_builder.dart';
import 'package:movie/core/utils/app_styles.dart';

class SectionsGetGenresWidgets extends StatelessWidget {
  const SectionsGetGenresWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
          child: Text('Genres', style: AppStyles.styles19W500),
        ),
        const SizedBox(
          height: 100,
          child: GenresListViewSeparatedBlocBuilder(),
        ),
      ],
    );
  }
}
