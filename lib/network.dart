import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImp implements NetworkInfo {
  final InternetConnectionChecker connctionChecker;

  NetworkInfoImp(this.connctionChecker);
  @override
  Future<bool> get isConnected => connctionChecker.hasConnection;
}
