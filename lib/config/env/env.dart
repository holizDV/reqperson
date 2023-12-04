import 'package:envied/envied.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'env.g.dart';

@Envied(path: ".dev.env", obfuscate: true)
abstract class DevEnv {
  @EnviedField(varName: 'BASE_URL')
  static String baseUrl = _DevEnv.baseUrl;
}

@Envied(path: ".prod.env", obfuscate: true)
abstract class ProdEnv {
  @EnviedField(varName: 'BASE_URL')
  static String baseUrl = _ProdEnv.baseUrl;
}

enum EnvironmentType { dev, prod }

class AppEnvironment {
  AppEnvironment._();
  static AppEnvironment get instance => AppEnvironment._();

  Future<EnvironmentType> getCurrentEnv() async {
    final packageInfo = await PackageInfo.fromPlatform();
    switch (packageInfo.packageName) {
      case "com.debmind.taskx.development":
        return EnvironmentType.dev;
      case "com.debmind.taskx":
        return EnvironmentType.prod;
      default:
        return EnvironmentType.prod;
    }
  }

  Future<String> getBaseUrlBasedOnEnv() async {
    final currentEnv = await getCurrentEnv();

    if (currentEnv == EnvironmentType.dev) {
      return Future.value(DevEnv.baseUrl);
    } else {
      return Future.value(ProdEnv.baseUrl);
    }
  }
}
