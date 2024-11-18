import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
part 'person_entity.g.dart';

@HiveType(typeId: 4)
class PersonEntity extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? profilePath;
  @HiveField(3)
  final List<KnownForEntity> knownFor;

  const PersonEntity(
      {required this.id,
       this.name,
       this.profilePath,
      required this.knownFor});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, profilePath, knownFor];
}

@HiveType(typeId: 5)
class KnownForEntity extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? posterPath;
  @HiveField(3)
  final String? releaseDate;

  const KnownForEntity(
      {required this.id,
       this.title,
      this.posterPath,
      this.releaseDate});

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, posterPath, releaseDate];
}
