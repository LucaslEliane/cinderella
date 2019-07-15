import 'dart:ui';

import 'package:client/views/welcome/widgets/pager_slider.dart';
import 'package:flutter/material.dart';

class DragAnimation {
  static const ANIMATED_PERCENT_PER_MILISECOND = 0.005;

  AnimationController welcomeDragCompletedController;

  final slideDirection;

  DragAnimation({
    this.slideDirection,
    slidePercent,
    slidePercentGoal,
    sliderUpdater,
    TickerProvider vsync
  }) {
    double slideRemaining;
    if (slidePercentGoal == 1) {
      slideRemaining = 1 - slidePercent;
    } else {
      slideRemaining = slidePercent;
    }

    final duration = new Duration(
      milliseconds: (slideRemaining / ANIMATED_PERCENT_PER_MILISECOND).round().abs()
    );

    welcomeDragCompletedController = new AnimationController(
      duration: duration,
      vsync: vsync
    )
    ..addListener(() {
      slidePercent = lerpDouble(
        slidePercent,
        slidePercentGoal,
        welcomeDragCompletedController.value
      );

      sliderUpdater.add(
        new SliderState(
          slideDirection,
          slidePercent,
          SliderEventType.animating
        )
      );
    })
    ..addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        sliderUpdater.add(
          new SliderState(
            slideDirection,
            slidePercent,
            SliderEventType.doneAnimating
          )
        );
      }
    });
  }

  run() {
    welcomeDragCompletedController.forward(from: 0.0);
  }

  dispose() {
    welcomeDragCompletedController.dispose();
  }
}