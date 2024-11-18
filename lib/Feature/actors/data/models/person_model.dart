import 'package:movie/Feature/actors/domin/entities/person_entity.dart';

class PersonModel extends PersonEntity {
  const PersonModel(
      {required super.id,
      super.name,
      super.profilePath,
      required super.knownFor});

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
      id: json['id'],
      name: json['name'],
      profilePath: json['profile_path'],
      knownFor:
          List.from(json['known_for'].map((e) => KnownForModel.fromJson(e))));
}

class KnownForModel extends KnownForEntity {
  const KnownForModel(
      {required super.id, super.title, super.posterPath, super.releaseDate});

  factory KnownForModel.fromJson(Map<String, dynamic> json) => KnownForModel(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date']);
}
