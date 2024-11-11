import 'package:equatable/equatable.dart';

class CollectionEntity extends Equatable {
  final int id;
  final String name;
  final String backdropPath;
  final List<PartsEntity>? parts;

  const CollectionEntity(
      {required this.id,
      required this.name,
      required this.backdropPath,
      this.parts});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, backdropPath, parts];
}

class PartsEntity extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String backdropPath;
  final String releaseDate;
  final num voteAverage;

  const PartsEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, title, overview, backdropPath, releaseDate, voteAverage];
}
