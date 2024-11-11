import 'package:movie/Feature/home/domin/entities/actor_movies_entity.dart';

class ActorMoviesModel extends ActorMoviesEntity {
  const ActorMoviesModel(
      {required super.id,
      required super.title,
      required super.posterPath,
      required super.releaseDate,
      required super.overview,
      required super.voteAverage});
  factory ActorMoviesModel.fromJson(Map<String, dynamic> json) {
    return ActorMoviesModel(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      overview: json['overview'],
      voteAverage: json['vote_average'],
    );
  }
}
