import 'package:flutter/material.dart';
import 'package:movie/Feature/home/presentation/view/functions/navigate_movie_detail_view.dart';
import 'package:movie/Feature/home/presentation/view/widget/image_carousel_slider_widget.dart';

class ItemListViewWidget extends StatelessWidget {
  const ItemListViewWidget({
    super.key,
    required this.image,
    required this.id,
  });

  final String image;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
          navigateMovieDetailView(context, id: id);
        },
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            child: ImageCarouselSliderWidget(
              width: 120,
              heightLoading: 170,
              widthLoading: 120,
              height: 170,
              image: image,
            )),
      ),
    );
  }
}
