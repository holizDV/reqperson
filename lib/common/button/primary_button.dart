import 'package:flutter/material.dart';

import '../../config/theme/theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.onTap,
    this.text = "Next",
    this.isDisable = false,
    this.icon = Icons.arrow_forward_ios,
    super.key,
  });

  final String text;
  final Function() onTap;
  final bool isDisable;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisable ? null : () async => await onTap(),
      child: Container(
        color: isDisable
            ? AppColor.foregroundSecondaryText
            : AppColor.backgroundCard,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.s16,
          vertical: AppSize.s20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Typograph.text16SemiBold.copyWith(color: AppColor.primary),
            ),
            Icon(
              icon,
              color: AppColor.specialAlwaysDark,
              size: 24,
            )
          ],
        ),
      ),
    );
  }
}
