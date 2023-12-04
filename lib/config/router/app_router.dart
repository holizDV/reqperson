import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart' as wd;

import 'app_router.gr.dart';
import 'transitions.dart';

final navKey = wd.GlobalKey<wd.NavigatorState>();

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
          initial: true,
        ),
        TransitionRoute(page: RegistrationRoute.page),
        TransitionRoute(page: PersonRoute.page),
        TransitionRoute(page: CreatePersonRoute.page),
      ];
}
