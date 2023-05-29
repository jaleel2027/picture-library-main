import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/color_utilities.dart';
import '../utils/font_style_utilities.dart';

showMySnackBar({required String message}) {
  Get.showSnackbar(
    GetSnackBar(
      messageText: Text(
        message,
        style: FontStyleUtilities.h12(
          fontColor: ColorUtilities.whiteColor,
        ),
      ),
      duration: const Duration(
        seconds: 3,
      ),
      animationDuration: const Duration(
        milliseconds: 500,
      ),
      barBlur: 5,
      snackPosition: SnackPosition.TOP,
      backgroundGradient: const LinearGradient(
        colors: [ColorUtilities.blueColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  );
}
