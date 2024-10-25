import 'package:equatable/equatable.dart';

class MovieDetailsEntity extends Equatable {
  final String backdropPath;
  final String overview;
  final int id;
  final String title;
  final List<GenreEntity> genres;
  final num voteAverage;
  final int runtime;
  final String releaseDate;

  const MovieDetailsEntity(
      {required this.backdropPath,
      required this.overview,
      required this.id,
      required this.title,
      required this.genres,
      required this.voteAverage,
      required this.runtime,
      required this.releaseDate});

  @override
  List<Object> get props => [
        backdropPath,
        overview,
        id,
        title,
        genres,
        voteAverage,
        runtime,
        releaseDate
      ];
}

class GenreEntity extends Equatable {
  final int id;
  final String name;
  const GenreEntity({required this.id, required this.name});
  @override
  List<Object> get props => [id, name];
}
