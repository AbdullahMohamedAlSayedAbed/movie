import 'package:movie/core/errors/failure.dart';

class ErrorMessageModel extends Failure {
  final int statusCode;
  ErrorMessageModel(super.message, this.statusCode);
  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(json['status_message'], json['status_code']);
  }
}
