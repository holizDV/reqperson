import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../config/theme/theme.dart';

class LoadingFading {
  LoadingFading._();
  static LoadingFading get instance => LoadingFading._();

  show(BuildContext context, bool isLoading) {
    if (!isLoading) return Navigator.pop(context);

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final size = MediaQuery.of(context).size;

        return WillPopScope(
          onWillPop: () async {
            if (isLoading) return false;
            return true;
          },
          child: Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: size.width * 0.38),
            child: Container(
              height: 100,
              padding: const EdgeInsets.symmetric(vertical: AppSize.s20),
              decoration: BoxDecoration(
                color: AppColor.backgroundCard,
                borderRadius: BorderRadius.circular(AppSize.s12),
              ),
              child: const SpinKitFadingCircle(
                color: AppColor.primary,
                size: 52,
              ),
            ),
          ),
        );
      },
    );
  }
}
