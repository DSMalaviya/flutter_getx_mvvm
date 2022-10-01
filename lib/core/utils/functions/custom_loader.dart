import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../values/colors.dart';

void onLoading() {
  Get.dialog(WillPopScope(
    onWillPop: () async => false,
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
      child: SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.white,
        insetPadding: EdgeInsets.symmetric(horizontal: .2.sw),
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  blueColor,
                ),
                backgroundColor: Color.fromRGBO(247, 249, 244, 1),
                strokeWidth: 5.0,
              ),
            ),
          )
        ],
      ),
    ),
  ));
}
