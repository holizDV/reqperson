import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import '../config/env/build_config.dart';
import '../config/router/router.dart';
import '../config/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = AppRouter(navigatorKey: navKey);

  @override
  Widget build(BuildContext context) {
    if (BuildConfig.isDebugLayout()) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "Reqperson Preview",
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        theme: getApplicationTheme(),
        builder: DevicePreview.appBuilder,
        locale: DevicePreview.locale(context),
      );
    } else {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "Reqperson",
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        theme: getApplicationTheme(),
      );
    }
  }
}
