import 'package:flutter/material.dart';

import '../../../../config/theme/theme.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({
    super.key,
    required this.email,
    required this.fullName,
    required this.onTap,
  });

  final String email;
  final String fullName;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSize.s16),
        decoration: BoxDecoration(
          color: AppColor.backgroundCard,
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              email,
              style: Typograph.text14SemiBold.copyWith(color: AppColor.primary),
            ),
            const SizedBox(height: AppSize.s10),
            Text(
              fullName,
              style: Typograph.text12Medium.copyWith(color: AppColor.primary),
            ),
          ],
        ),
      ),
    );
  }
}
