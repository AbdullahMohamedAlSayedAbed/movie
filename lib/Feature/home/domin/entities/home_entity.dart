import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';

part 'home_entity.g.dart';

@HiveType(typeId: 0)
class HomeEntity extends Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String? image;

  @HiveField(3)
  final String? backdropPath;

  @HiveField(4)
  final String? overview;

  @HiveField(5)
  final String? releaseDate;

  @HiveField(6)
  final num voteAverage;

  @HiveField(7)
  final List<int>? genreIds;

  const HomeEntity({
    required this.id,
    required this.title,
    this.image,
    this.backdropPath,
    this.overview,
    this.releaseDate,
    required this.voteAverage,
    this.genreIds,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        image,
        backdropPath,
        overview,
        voteAverage,
        genreIds,
        releaseDate,
      ];
}
