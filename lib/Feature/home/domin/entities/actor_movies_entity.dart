import 'package:equatable/equatable.dart';

class ActorMoviesEntity extends Equatable {
  final int id;
  final String title;
  final String? posterPath;
  final String? releaseDate;
  final String? overview;
  final num? voteAverage;

  const ActorMoviesEntity(
      {required this.id,
      required this.title,
      required this.posterPath,
      required this.releaseDate,
      required this.overview,
      required this.voteAverage});

  @override
  List<Object?> get props => [id, title, posterPath, releaseDate, overview, voteAverage];
}
