import 'package:equatable/equatable.dart';

class RecommendationEntity extends Equatable {
  final int id;
  final String? backdropPath;

  const RecommendationEntity({required this.id,  this.backdropPath});
  
  @override
  List<Object?> get props => [id, backdropPath];
}
