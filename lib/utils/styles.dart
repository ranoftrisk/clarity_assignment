import 'package:flutter/material.dart';

class Styles{

  static const _largeSize = 20.0;
  static const _mediumSize = 16.0;
  static const _smallSize = 12.0;

  static const appBarTextStyle = TextStyle(
      fontSize: _largeSize,
      fontWeight: FontWeight.bold
  );
  static const headlineTextStyle = TextStyle(
    fontSize: _mediumSize,
    fontWeight: FontWeight.bold
  );
  static const valueTextStyle = TextStyle(
    fontSize: _mediumSize,
    fontWeight: FontWeight.normal
  );

}

class ColorStyles{
  static const frontColor = Colors.white70;
  static const backColor = Colors.lightGreenAccent;
  static const callToAction = Colors.red;
  static const textFieldColor = Colors.blue;
}