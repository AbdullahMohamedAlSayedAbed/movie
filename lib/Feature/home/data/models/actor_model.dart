import 'package:movie/Feature/home/domin/entities/actor_entity.dart';

class ActorModel extends ActorEntity {
  const ActorModel(
      {required super.id,
      required super.name,
      super.profilePath,
      super.biography,
      super.address,
      super.birthday,});

  factory ActorModel.fromJson(Map<String, dynamic> json) {
    return ActorModel(
      id: json['id'],
      name: json['name'],
      birthday: json['birthday'],
      profilePath: json['profile_path'],
      biography: json['biography'],
      address: json['place_of_birth'],
    );
  }
}
