import 'package:movie/Feature/home/domin/entities/movie_detailes_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.overview,
      required super.id,
      required super.title,
      required super.genres,
      required super.voteAverage,
      required super.runtime,
      required super.releaseDate});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
        backdropPath: json['backdrop_path'] ?? '',
        overview: json['overview'] ?? '',
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        genres: List<GenreModel>.from(
            json['genres'].map((x) => GenreModel.fromJson(x))),
        voteAverage: json['vote_average'] ?? 0.0,
        runtime: json['runtime'] ?? 0,
        releaseDate: json['release_date'] ?? '');
  }
}

class GenreModel extends GenreEntity {
  const GenreModel({required super.id, required super.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(id: json['id'] ?? 0, name: json['name'] ?? '');
  }
}
