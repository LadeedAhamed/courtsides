import 'package:courtsides/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TSpacingStyles {
  TSpacingStyles._();
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: TSizes.appBarHeight,
    bottom: TSizes.defaultSpace,
    left: TSizes.defaultSpace,
    right: TSizes.defaultSpace,
  );
}
