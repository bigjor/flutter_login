import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppStyle {
  AppStyle._();

  static const Color primary = Color(0xFF2C2B3F);
  static const Color secondary = Color(0xFF645C64);
  static const Color third = Color(0xFF7A69B0);
  static const Color accent = Color(0xFF35B5AD);
  static const Color lighter = Color(0xFFE6E1E4);

  static BorderRadiusGeometry kBorderRadius = BorderRadius.circular(10.0);

  static BoxShadow kBoxShadow = BoxShadow(
    color: Colors.black.withOpacity(0.4),
    blurRadius: 6.0,
    offset: const Offset(0, 6),
  );

  static BoxDecoration kBoxDecorationStyleInputActive = BoxDecoration(
    color: AppStyle.third,
    borderRadius: kBorderRadius,
    boxShadow: [kBoxShadow],
  );

  static BoxDecoration kBoxDecorationStyleInput = BoxDecoration(
    color: AppStyle.primary,
    borderRadius: kBorderRadius,
    boxShadow: [kBoxShadow],
  );

  static BoxDecoration kBoxDecorationStyleButton = BoxDecoration(
    color: AppStyle.accent,
    borderRadius: kBorderRadius,
    boxShadow: [kBoxShadow],
  );

  static ButtonStyle kButtonStyle = ElevatedButton.styleFrom(
    primary: AppStyle.accent,
    minimumSize: Size(double.infinity, 50),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  );

  static TextStyle kHintTextStyle = TextStyle(
    color: Colors.white54,
    fontFamily: 'OpenSans',
  );
}
