import 'package:movie/Feature/home/domin/entities/home_entity.dart';

class HomeModel extends HomeEntity {
  const HomeModel(
      {required super.id,
      required super.title,
      required super.image,
      required super.backdropPath,
      required super.overview,
      required super.releaseDate,
      required super.voteAverage,
      required super.genreIds});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
        id: json['id'],
        title: json['title'],
        image: json['poster_path'],
        backdropPath: json['backdrop_path'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        voteAverage: json['vote_average'],
        genreIds: List<int>.from(json['genre_ids']).map((e) => e).toList());
  }
}
