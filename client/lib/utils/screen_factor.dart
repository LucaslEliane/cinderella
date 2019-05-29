import 'package:flutter/material.dart';
import 'dart:ui';

class ScreenFactor {
  factory ScreenFactor() => _sharedInstance();

  static ScreenFactor _instance = ScreenFactor._();

  Size _physicalSize;
  double _devicePixelRatio;

  ScreenFactor._() {
    _physicalSize = window.physicalSize;
    _devicePixelRatio = window.devicePixelRatio;
  }

  static ScreenFactor _sharedInstance() {
    return _instance;
  }

  Size get physicalSize {
    return _physicalSize;
  }

  double get devicePixelRatio {
    return _devicePixelRatio;
  }
  
}