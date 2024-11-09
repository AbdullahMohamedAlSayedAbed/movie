
import 'package:movie/Feature/home/domin/entities/cast_entity.dart';

class CastsModel extends CastEntity {
  const CastsModel(
      {required super.adult,
      required super.gender,
      required super.id,
      required super.knownForDepartment,
      required super.name,
      required super.originalName,
      required super.popularity,
      required super.profilePath,
      required super.castId,
      required super.character,
      required super.creditId,
      required super.order});

  factory CastsModel.fromJson(Map<String, dynamic> json) => CastsModel(
        adult: json['adult'] as bool?,
        gender: json['gender'] as int?,
        id: json['id'] as int?,
        knownForDepartment: json['known_for_department'] as String?,
        name: json['name'] as String?,
        originalName: json['original_name'] as String?,
        popularity: (json['popularity'] as num?)?.toDouble(),
        profilePath: json['profile_path'] as String?,
        castId: json['cast_id'] as int?,
        character: json['character'] as String?,
        creditId: json['credit_id'] as String?,
        order: json['order'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'gender': gender,
        'id': id,
        'known_for_department': knownForDepartment,
        'name': name,
        'original_name': originalName,
        'popularity': popularity,
        'profile_path': profilePath,
        'cast_id': castId,
        'character': character,
        'credit_id': creditId,
        'order': order,
      };
}
