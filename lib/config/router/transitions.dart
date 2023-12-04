import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

class TransitionRoute extends CustomRoute {
  TransitionRoute({
    required PageInfo<dynamic> page,
    bool initial = false,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)
        transitionsBuilders = TransitionsBuilders.slideBottom,
  }) : super(
          page: page,
          transitionsBuilder: transitionsBuilders,
          durationInMilliseconds: 200,
          reverseDurationInMilliseconds: 150,
          initial: initial,
        );
}
