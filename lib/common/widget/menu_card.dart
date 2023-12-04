import 'package:flutter/material.dart';

import '../../../config/theme/theme.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
    required this.tag,
    required this.icon,
    required this.onTap,
    this.bgIconColor = AppColor.blue,
  }) : super(key: key);

  final String tag;
  final Widget icon;
  final Color bgIconColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: width * 0.6,
        padding: const EdgeInsets.all(AppSize.s4),
        decoration: BoxDecoration(
          color: AppColor.background,
          borderRadius: BorderRadius.circular(AppSize.s24),
          border: Border.all(
            color: AppColor.specialAlwaysWhite,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSize.s8),
              width: AppSize.s42,
              decoration: BoxDecoration(
                color: bgIconColor,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: icon,
            ),
            const SizedBox(width: AppSize.s10),
            Flexible(
              child: Text(
                tag,
                style: Typograph.text16Medium,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
