import 'package:flutter/material.dart';

import '../../generate/gen/fonts.gen.dart';
import 'theme.dart';

abstract class Typograph {
  static const titleH1 = TextStyle(
    fontFamily: FontFamily.rubik,
    color: AppColor.primaryText,
    fontWeight: FontWeight.w700,
    fontSize: FontSize.s32,
    height: AppSize.s40 / FontSize.s32,
  );
  static const titleH2 = TextStyle(
    fontFamily: FontFamily.rubik,
    color: AppColor.primaryText,
    fontWeight: FontWeight.w700,
    fontSize: FontSize.s24,
    height: AppSize.s32 / FontSize.s24,
  );
  static const titleH3 = TextStyle(
    fontFamily: FontFamily.rubik,
    color: AppColor.primaryText,
    fontWeight: FontWeight.w700,
    fontSize: FontSize.s20,
    height: AppSize.s28 / FontSize.s20,
  );
  static const titleH4 = TextStyle(
    fontFamily: FontFamily.rubik,
    color: AppColor.primaryText,
    fontWeight: FontWeight.w700,
    fontSize: FontSize.s16,
    height: AppSize.s24 / FontSize.s16,
  );

  static TextStyle text20Medium = const TextStyle(
    color: AppColor.primaryText,
    fontFamily: FontFamily.rubik,
    fontSize: FontSize.s20,
    fontWeight: FontWeight.w500,
    height: AppSize.s30 / FontSize.s20,
  );

  static TextStyle text16SemiBold = const TextStyle(
    color: AppColor.primaryText,
    fontFamily: FontFamily.rubik,
    fontSize: FontSize.s16,
    fontWeight: FontWeight.w600,
    height: AppSize.s24 / FontSize.s16,
  );
  static TextStyle text16Medium = const TextStyle(
    color: AppColor.primaryText,
    fontFamily: FontFamily.rubik,
    fontSize: FontSize.s16,
    fontWeight: FontWeight.w500,
    height: AppSize.s24 / FontSize.s16,
  );
  static TextStyle text16Regular = const TextStyle(
    color: AppColor.primaryText,
    fontFamily: FontFamily.rubik,
    fontSize: FontSize.s16,
    fontWeight: FontWeight.w400,
    height: AppSize.s24 / FontSize.s16,
  );

  static TextStyle text14SemiBold = const TextStyle(
    color: AppColor.primaryText,
    fontFamily: FontFamily.rubik,
    fontSize: FontSize.s14,
    fontWeight: FontWeight.w600,
    height: AppSize.s20 / FontSize.s14,
  );
  static TextStyle text14Medium = const TextStyle(
    color: AppColor.primaryText,
    fontFamily: FontFamily.rubik,
    fontSize: FontSize.s14,
    fontWeight: FontWeight.w500,
    height: AppSize.s20 / FontSize.s14,
  );
  static TextStyle text14Regular = const TextStyle(
    color: AppColor.primaryText,
    fontFamily: FontFamily.rubik,
    fontSize: FontSize.s14,
    fontWeight: FontWeight.w400,
    height: AppSize.s20 / FontSize.s14,
  );

  static TextStyle text12SemiBold = const TextStyle(
    color: AppColor.primaryText,
    fontFamily: FontFamily.rubik,
    fontSize: FontSize.s12,
    fontWeight: FontWeight.w600,
    height: AppSize.s16 / FontSize.s12,
  );
  static TextStyle text12Medium = const TextStyle(
    color: AppColor.primaryText,
    fontFamily: FontFamily.rubik,
    fontSize: FontSize.s12,
    fontWeight: FontWeight.w500,
    height: AppSize.s16 / FontSize.s12,
  );
  static TextStyle text12Regular = const TextStyle(
    color: AppColor.primaryText,
    fontFamily: FontFamily.rubik,
    fontSize: FontSize.s12,
    fontWeight: FontWeight.w400,
    height: AppSize.s16 / FontSize.s12,
  );

  static const buttonSubtitle = TextStyle(
    fontFamily: FontFamily.rubik,
    color: AppColor.primaryText,
    fontWeight: FontWeight.w500,
    fontSize: FontSize.s14,
    height: AppSize.s22 / FontSize.s14,
  );

  static const smallButton = TextStyle(
    fontFamily: FontFamily.rubik,
    color: AppColor.primaryText,
    fontWeight: FontWeight.w500,
    fontSize: FontSize.s12,
    height: AppSize.s18 / FontSize.s12,
  );
}
