import 'package:flutter/material.dart';
import 'package:movie/Feature/home/presentation/view/movie_detail_view.dart';

void navigateMovieDetailView(BuildContext context, {required int id}) {
  Navigator.push(context, MaterialPageRoute(
    builder: (context) {
      return MovieDetailView(id: id);
    },
  ));
}
