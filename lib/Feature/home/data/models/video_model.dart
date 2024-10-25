import 'package:movie/Feature/home/domin/entities/video_entity.dart';

class VideoModel extends VideoEntity {
  const VideoModel(super.key);

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(json['key']);
  }
}
