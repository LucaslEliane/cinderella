import 'package:flutter/material.dart';

enum SliderEventType {
  dragging,
  doneDragging,
  animating,
  doneAnimating
}
class SliderState {
  final direction;
  final slidePercent;
  final sliderEventType;

  SliderState(
    this.direction,
    this.slidePercent,
    this.sliderEventType
  );
}