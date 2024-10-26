import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> checkInternetConnection() async {
  bool isConnected = await InternetConnectionChecker().hasConnection;
  return isConnected;
}