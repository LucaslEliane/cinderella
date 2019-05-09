import 'package:flutter/material.dart';

class ScreenFactor {
  ScreenFactor._();

  static ScreenFactor _screenFactor;
  
  static ScreenFactor getInstance() {
    if (_screenFactor == null) {
      _screenFactor= ScreenFactor._();
    }
    return _screenFactor;
  }

  
}