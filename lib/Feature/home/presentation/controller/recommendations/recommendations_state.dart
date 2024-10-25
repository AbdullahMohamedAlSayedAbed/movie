part of 'recommendations_cubit.dart';

sealed class RecommendationsState extends Equatable {
  const RecommendationsState();

  @override
  List<Object> get props => [];
}

final class RecommendationsInitial extends RecommendationsState {}
final class RecommendationsLoading extends RecommendationsState {}
final class RecommendationsSuccess extends RecommendationsState {
  final List<RecommendationEntity> recommendations;
  const RecommendationsSuccess(this.recommendations);
  @override
  List<Object> get props => [recommendations];
}
final class RecommendationsFailure extends RecommendationsState {
  final String errMessage;
  const RecommendationsFailure(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}
