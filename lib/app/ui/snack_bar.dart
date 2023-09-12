import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBars {
  static errorSnackBar({
    required String message,
    String? title,
    double? width,
    SnackPosition? snackPosition,
    EdgeInsets? margin,
  }) {
    Get.rawSnackbar(
      title: title,
      message: message,
      maxWidth: width,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: snackPosition ?? SnackPosition.BOTTOM,
      margin: margin ?? const EdgeInsets.all(24),
      borderRadius: 6,
      icon: const Icon(Icons.error, color: Colors.white),
      isDismissible: true,
      backgroundColor: Get.theme.errorColor,
    );
  }

  static successSnackBar({
    required String message,
    String? title,
    double? width,
    SnackPosition? snackPosition,
    EdgeInsets? margin,
  }) {
    return Get.rawSnackbar(
      title: title,
      message: message,
      maxWidth: width,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: snackPosition ?? SnackPosition.BOTTOM,
      margin: margin ?? const EdgeInsets.all(24),
      borderRadius: 6,
      icon: const Icon(Icons.check_circle_rounded, color: Colors.white),
      isDismissible: false,
      backgroundColor: Get.theme.primaryColor,
    );
  }

  static success({
    required String message,
    String? title,
    double? width,
    SnackPosition? snackPosition,
    EdgeInsets? margin,
    Color backgroundColor = const Color(0xFF102A43),
  }) {
    return Get.rawSnackbar(
      title: title,
      message: message,
      maxWidth: width,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: snackPosition ?? SnackPosition.BOTTOM,
      margin: margin ?? const EdgeInsets.all(16.0),
      borderRadius: 12.0,
      icon: const Icon(Icons.check_circle_rounded,
          color: Color.fromRGBO(96, 70, 170, 1)),
      isDismissible: false,
      backgroundColor: backgroundColor,
      animationDuration: const Duration(milliseconds: 500),
      // backgroundColor: Get.theme.primaryColor,
    );
  }

  static successSnackBarTopCenter({
    required String message,
    String? title,
    Color backgroundColor = const Color(0xFF102A43),
  }) {
    success(
      title: title,
      message: message,
      width: Get.width * .5,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.only(top: 0),
      backgroundColor: backgroundColor,
    );
  }
}
