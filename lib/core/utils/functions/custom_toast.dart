import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';

makeToast({required String toastData, Alignment? toastAlign}) {
  showToast(
    toastData,
    context: Get.overlayContext,
    backgroundColor: Get.theme.brightness == Brightness.dark
        ? Colors.white
        : Colors.black.withOpacity(.7),
    textStyle: TextStyle(
      color:
          Get.theme.brightness == Brightness.dark ? Colors.black : Colors.white,
    ),
    animation: StyledToastAnimation.slideFromBottomFade,
    reverseAnimation: StyledToastAnimation.fade,
    duration: const Duration(seconds: 3),
    alignment: toastAlign ?? Alignment.bottomCenter,
  );
}
