import 'package:flutter/material.dart';
import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';
import 'package:movie/Feature/home/presentation/view/discover_view.dart';
import 'package:movie/Feature/home/presentation/view/widget/genres_item_widget.dart';

class GenresListViewSeparated extends StatelessWidget {
  const GenresListViewSeparated({
    super.key,
    required this.genreEntity,
  });
  final List<GenreEntity> genreEntity;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        width: 15,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: genreEntity.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return DiscoverView(genreEntity: genreEntity[index]);
              },
            ));
          },
          child: GenresItemWidget(
            title: genreEntity[index].name,
          ),
        );
      },
    );
  }
}
