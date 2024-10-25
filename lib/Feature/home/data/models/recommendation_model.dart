import 'package:movie/Feature/home/domin/entities/recommendation_entity.dart';

class RecommendationModel extends RecommendationEntity {
  const RecommendationModel({required super.id, required super.backdropPath});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
        id: json['id'], backdropPath: json['backdrop_path']);
  }
}
