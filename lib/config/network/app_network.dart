import '../env/env.dart';

class AppNetwork {
  static AppNetwork? _instance;
  late String _value;

  factory AppNetwork() {
    _instance ??= AppNetwork._internal();
    return _instance!;
  }

  AppNetwork._internal() {
    _value = "";
  }
  Future<void> initEnv() async {
    value = await AppEnvironment.instance.getBaseUrlBasedOnEnv();
  }

  String get baseUrl => _value;

  set value(String newValue) {
    _value = newValue;
  }

  static const receiveTimeout = Duration(seconds: 60);
  static const connectionTimeout = Duration(seconds: 60);
}
