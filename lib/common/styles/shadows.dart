import 'package:flutter/material.dart';
import '../../utils/constents/colors.dart';

class TShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: TColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2)
  ); // Boxshadow
  static final horizontalProductShadow = BoxShadow(
      color: TColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset (0, 2)
  );
}