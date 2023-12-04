import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../config/theme/theme.dart';

class LoadingScreenDialog extends StatelessWidget {
  const LoadingScreenDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 90,
        padding: const EdgeInsets.symmetric(vertical: AppSize.s20),
        decoration: BoxDecoration(
          color: AppColor.backgroundCard,
          borderRadius: BorderRadius.circular(AppSize.s12),
          boxShadow: const [
            BoxShadow(
              color: AppColor.foregroundBorder,
              blurRadius: 3,
            ),
          ],
        ),
        child: const SpinKitFadingCircle(
          color: AppColor.primary,
          size: 52,
        ),
      ),
    );
  }
}
