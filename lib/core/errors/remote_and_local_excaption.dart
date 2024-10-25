import 'package:movie/core/errors/error_message_model.dart';

class LocalException implements Exception {
  final String? message;
  LocalException({this.message});
}

class RemoteException implements Exception {
  final ErrorMessageModel? messageModel;
  RemoteException({this.messageModel});
}
