import 'package:flutter/material.dart';

import '../../config/theme/theme.dart';

class MessageToast {
  MessageToast._();
  static MessageToast get instance => MessageToast._();

  showError(BuildContext context, String message) {
    final snackbar = SnackBar(
      content: Row(
        children: [
          Container(
            width: AppSize.s20,
            height: AppSize.s20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.statusOverdue,
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.close,
              color: AppColor.backgroundCard,
              size: AppSize.s16,
            ),
          ),
          const SizedBox(width: AppSize.s8),
          Flexible(
            child: Text(
              message,
              style: Typograph.text14Regular.copyWith(color: AppColor.primary),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 246, 217, 217),
      duration: const Duration(seconds: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(12),
      ),
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackbar);
  }
}
