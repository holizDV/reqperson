import 'package:flutter/foundation.dart';

enum DebugMode { debugOnly, debugLayout }

enum Flavor { dev, prod }

class BuildConfig {
  BuildConfig._(this.debugMode, this.flavor);

  final DebugMode debugMode;
  final Flavor? flavor;

  static late BuildConfig _instance;

  static void init(String? flavor) {
    debugPrint(
        "╔══════════════════════════════════════════════════════════════╗");
    debugPrint(
        "                    Build Flavor: $flavor                       ");
    debugPrint(
        "╚══════════════════════════════════════════════════════════════╝");

    const strDebugMode = String.fromEnvironment("DEBUG_MODE");
    const debugMode = (strDebugMode == "DEBUG_LAYOUT")
        ? DebugMode.debugLayout
        : DebugMode.debugOnly;

    switch (flavor) {
      case "dev":
        _instance = BuildConfig._(debugMode, Flavor.dev);
        break;
      default:
        _instance = BuildConfig._(debugMode, Flavor.prod);
    }
  }

  static bool isDebugLayout() => _instance.debugMode == DebugMode.debugLayout;
  static bool isProd() => _instance.flavor == Flavor.prod;
}
