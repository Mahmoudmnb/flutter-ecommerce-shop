import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetInfo {
  static Future<bool> isConnected() async {
    InternetConnectionChecker netInfo = InternetConnectionChecker();
    return netInfo.hasConnection;
  }
}
