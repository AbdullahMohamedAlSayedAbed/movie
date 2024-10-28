import 'package:movie/Feature/home/domin/entities/collection_entity.dart';

class CollectionModel extends CollectionEntity {
  const CollectionModel(
      {required super.id,
      required super.name,
      required super.backdropPath,
       super.parts});
  factory CollectionModel.fromJson(Map<String, dynamic> json) {
    return CollectionModel(
      id: json['id'],
      name: json['name'],
      backdropPath: json['backdrop_path'],
      parts: List<PartsModel>.from(
          json['parts'].map((x) => PartsModel.fromJson(x))),
    );
  }
}

class PartsModel extends PartsEntity {
  const PartsModel(
      {required super.id,
      required super.title,
      required super.overview,
      required super.backdropPath,
      required super.releaseDate,
      required super.voteAverage,});

  factory PartsModel.fromJson(Map<String, dynamic> json) {
    return PartsModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      backdropPath: json['backdrop_path'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'],
    );
  }
}
