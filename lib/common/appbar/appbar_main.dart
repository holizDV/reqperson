import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppbarMain extends StatelessWidget implements PreferredSizeWidget {
  const AppbarMain({
    super.key,
    required this.title,
    this.onTapBack,
    this.actions,
    this.isAutomaticallyImplyBack = true,
    this.centerTitle = false,
  });

  final String title;
  final Function()? onTapBack;
  final List<Widget>? actions;
  final bool isAutomaticallyImplyBack;
  final bool centerTitle;

  List<Widget> _action(BuildContext context) {
    return [
      Transform.translate(
        offset: const Offset(-10, 0),
        child: Transform.scale(
          scale: 1.2,
          child: IconButton(
            onPressed: () {
              if (onTapBack != null) {
                onTapBack!();
              } else {
                context.router.pop();
              }
            },
            highlightColor: Colors.transparent,
            icon: const Icon(Icons.close),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: isAutomaticallyImplyBack ? _action(context) : null,
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44.0);
}
