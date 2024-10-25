import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final String key;

  const VideoEntity(this.key);

  @override
  // TODO: implement props
  List<Object?> get props => [key];
}
