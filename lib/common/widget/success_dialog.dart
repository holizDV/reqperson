import 'package:flutter/material.dart';

import '../../config/theme/theme.dart';

class SuccessDialog {
  SuccessDialog._();
  static SuccessDialog get instance => SuccessDialog._();

  show(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Dialog(
            backgroundColor: AppColor.backgroundCard,
            child: Container(
              padding: const EdgeInsets.all(AppSize.s24),
              decoration: BoxDecoration(
                color: AppColor.backgroundCard,
                borderRadius: BorderRadius.circular(AppSize.s12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: AppSize.s24),
                  const Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.info,
                      color: AppColor.statusSuccess,
                      size: 50,
                    ),
                  ),
                  const SizedBox(height: AppSize.s24),
                  Text(
                    "Success",
                    style: Typograph.titleH4.copyWith(color: AppColor.primary),
                  ),
                  const SizedBox(height: AppSize.s8),
                  Text(
                    "Person add to data",
                    style: Typograph.text14Regular
                        .copyWith(color: AppColor.primary),
                  ),
                  const SizedBox(height: AppSize.s24),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Close"),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
