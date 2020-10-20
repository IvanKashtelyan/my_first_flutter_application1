import 'package:flutter/widgets.dart';

class SizeConfig {
  static double _referenceScreenHeight = 896.0;
  static double _referenceScreenWidth = 414.0;
  static MediaQueryData _mediaQueryData;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;

  static double safeAreaVerticalTop;
  static double safeAreaVerticalBottom;
  static double safeAreaRight;
  static double safeAreaLeft;

  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  static double fontSize(double font) {
    double value = _mediaQueryData.orientation == Orientation.portrait
        ? screenWidth / _referenceScreenWidth
        : screenHeight / _referenceScreenWidth;

    return font * value;
  }

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    safeAreaVerticalTop = _mediaQueryData.padding.top;
    safeAreaVerticalBottom = _mediaQueryData.padding.bottom;
    safeAreaRight = _mediaQueryData.padding.right;
    safeAreaLeft = _mediaQueryData.padding.left;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}
