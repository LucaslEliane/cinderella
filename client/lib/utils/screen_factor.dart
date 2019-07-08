import 'package:flutter/material.dart';
import 'dart:ui';

class ScreenFactor {
  factory ScreenFactor() => _sharedInstance();

  static ScreenFactor _instance = ScreenFactor._();

  MediaQueryData _screenMediaQueryData;

  Size _physicalSize;
  double _devicePixelRatio;

  ScreenFactor._() {
    _physicalSize = window.physicalSize;
    _devicePixelRatio = window.devicePixelRatio;
  }

  void initMediaQueryData(BuildContext context) {
    if (_screenMediaQueryData == null) {
      _screenMediaQueryData = MediaQuery.of(context);
    }
  }

  static ScreenFactor get instance => _sharedInstance();

  static ScreenFactor _sharedInstance() {
    return _instance;
  }

  Size get physicalSize {
    return _physicalSize;
  }

  double get devicePixelRatio {
    return _devicePixelRatio;
  }

  EdgeInsets get devicePadding {
    return _screenMediaQueryData.padding;
  }

  Size get logicalSize {
    return _screenMediaQueryData.size;
  }
  
}