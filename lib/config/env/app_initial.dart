import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/injection/injection.dart';
import '../network/network.dart';
import 'build_config.dart';

abstract class AppInitial {
  AppInitial() {
    _init();
  }

  FutureOr<StatelessWidget> onCreate();

  void _init() {
    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();

      await configureInjection();

      await const MethodChannel("flavor")
          .invokeMethod<String>("getFlavor")
          .then((flavor) async {
        BuildConfig.init(flavor);
      }).catchError((Object error) {
        debugPrint("Cannot get flavor");
        debugPrint(error.toString());
      });

      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );

      await AppNetwork().initEnv();

      final app = await onCreate();

      if (BuildConfig.isDebugLayout()) {
        runApp(DevicePreview(
          enabled: !kReleaseMode,
          builder: (_) => app,
        ));
      } else {
        runApp(app);
      }
    }, (error, stack) {
      debugPrint("$error: $stack");
    });
  }
}
