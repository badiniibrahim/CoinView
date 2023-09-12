import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color grey1 = Color(0xFFF5F5F5);
  static Color grey2 = Colors.grey.shade200;
  static Color grey3 = Colors.grey.shade300;
  static const Color grey4 = Color(0xFF5B6777); // #5B6777
  static const Color grey5 = Color(0xFF344356); // #344356
  static const Color grey6 = Color(0xFFD4DCE7); // #D4DCE7
  static const Color grey7 = Color(0xFFD5D5D5); // #D5D5D5
  static const Color grey8 = Color(0xFF777777); // #777777

  static const Color black = Color(0xFF000000); // #000000
  static const Color white = Color(0xFFFFFFFF); // #FFFFFF

  static const Color teal1 = Color.fromARGB(255, 46, 43, 1);

  /// Highlight color
  static const Color secondaryColor = Color(0xFFDEE3FF); // #DEE3FF
  static const Color darkSecondaryColor = Color(0xFFFFFFFF); // #FFFFFF

  static const Color primaryText = Color(0xFF333333); // #333333
  static const Color secondaryText = Color.fromARGB(255, 40, 40, 43); // #74788D

  static const Color primary = teal1;
}
