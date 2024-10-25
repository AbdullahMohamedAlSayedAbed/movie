import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';

part 'movie_detailes_entity.g.dart';

@HiveType(typeId: 2)
class MovieDetailsEntity extends Equatable {
  @HiveField(0)
  final String backdropPath;

  @HiveField(1)
  final String overview;

  @HiveField(2)
  final int id;

  @HiveField(3)
  final String title;

  @HiveField(4)
  final List<GenreEntity> genres;

  @HiveField(5)
  final num voteAverage;

  @HiveField(6)
  final int runtime;

  @HiveField(7)
  final String releaseDate;

  const MovieDetailsEntity({
    required this.backdropPath,
    required this.overview,
    required this.id,
    required this.title,
    required this.genres,
    required this.voteAverage,
    required this.runtime,
    required this.releaseDate,
  });

  @override
  List<Object> get props => [
        backdropPath,
        overview,
        id,
        title,
        genres,
        voteAverage,
        runtime,
        releaseDate,
      ];
}

@HiveType(typeId: 3)
class GenreEntity extends Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  const GenreEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
