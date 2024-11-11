part of 'casts_cubit.dart';

sealed class CastsState extends Equatable {
  const CastsState();

  @override
  List<Object> get props => [];
}

final class CastsInitial extends CastsState {}

final class CastsLoading extends CastsState {}

final class CastsSuccess extends CastsState {
  final List<CastEntity> casts;

  const CastsSuccess(this.casts);

  @override
  List<Object> get props => [casts];
}

final class CastsFailure extends CastsState {
  final String errMessage;

  const CastsFailure(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}
final class ActorInfoLoading extends CastsState {}

final class ActorInfoSuccess extends CastsState {
  final ActorEntity actorInfo;

  const ActorInfoSuccess(this.actorInfo);

  @override
  List<Object> get props => [actorInfo];
}

final class ActorInfoFailure extends CastsState {
  final String errMessage;

  const ActorInfoFailure(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}
