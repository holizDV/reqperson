import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'theme.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      background: AppColor.background,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.background,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColor.background,
        statusBarIconBrightness: Brightness.light,
      ),
      centerTitle: true,
      titleTextStyle: Typograph.titleH4,
      titleSpacing: AppSize.s24,
      actionsIconTheme: IconThemeData(color: AppColor.specialAlwaysWhite),
      iconTheme: IconThemeData(color: AppColor.specialAlwaysWhite),
    ),
  );
}
