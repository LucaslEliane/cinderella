import 'package:flutter/material.dart';

class DragAnimation {
  static const ANIMATED_PERCENT_PER_MILISECOND = 0.05;

  AnimationController welcomeDragCompletedController;

  final startSlidePercent;
  final slideDirection;


  DragAnimation({
    this.startSlidePercent,
    this.slideDirection
  }) {
    
  }
}