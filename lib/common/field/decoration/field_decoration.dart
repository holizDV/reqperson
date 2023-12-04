import 'package:flutter/material.dart';

import '../../../config/theme/theme.dart';

class FieldDecoration extends InputDecoration {
  const FieldDecoration({
    required this.text,
    this.readOnly = false,
    this.enableField = true,
    this.isFieldError = false,
    this.isFocused = false,
    this.enableFillColor = true,
    required this.fillFieldColor,
  });

  final String text;
  final bool readOnly;
  final bool enableField;
  final bool isFieldError;
  final bool isFocused;
  final bool enableFillColor;

  final Color fillFieldColor;

  Color get _enableBorder {
    if (isFieldError) {
      return AppColor.statusOverdue;
    }
    if (isFocused) {
      return AppColor.brandBlue;
    }
    return Colors.transparent;
  }

  Color get _fillColor {
    return fillFieldColor;
  }

  @override
  Color? get focusColor => AppColor.brandBlue;

  @override
  bool get enabled => enableField;

  @override
  bool get isCollapsed => true;

  @override
  bool? get isDense => true;

  @override
  bool? get filled => true;

  @override
  Color? get fillColor => _fillColor;

  @override
  String? get prefixText => "    ";

  @override
  TextStyle? get hintStyle =>
      Typograph.text14Regular.copyWith(color: AppColor.foregroundSecondaryText);

  @override
  TextStyle? get errorStyle =>
      Typograph.text14Regular.copyWith(color: AppColor.statusOverdue);

  @override
  EdgeInsetsGeometry? get contentPadding => const EdgeInsets.only(
      left: AppSize.zero, top: AppSize.s12, bottom: AppSize.s12);

  @override
  InputBorder? get border => const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s12)));

  @override
  InputBorder? get enabledBorder => OutlineInputBorder(
        borderSide: BorderSide(color: _enableBorder),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12)),
      );

  @override
  InputBorder? get focusedBorder => OutlineInputBorder(
        borderSide: BorderSide(color: _enableBorder),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12)),
      );

  @override
  InputBorder? get errorBorder => const OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.statusOverdue),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s12)),
        gapPadding: 0.0,
      );

  @override
  BoxConstraints? get suffixIconConstraints {
    return const BoxConstraints(
      maxWidth: 40,
      minWidth: 40,
    );
  }
}
