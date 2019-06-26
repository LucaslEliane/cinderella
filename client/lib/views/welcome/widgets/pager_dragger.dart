import 'dart:async';

import 'package:client/utils/screen_factor.dart';
import 'package:client/view_models/welcome.dart';
import 'package:client/views/welcome/widgets/pager_slider.dart';
import 'package:flutter/material.dart';

class PagerDragger extends StatefulWidget {
  final StreamController<SliderState> sliderUpdater;
  final canDragRightToLeft;
  final canDragLeftToRight;

  PagerDragger(
    this.sliderUpdater,
    this.canDragRightToLeft,
    this.canDragLeftToRight
  );

  @override
  _PagerDraggerState createState() => _PagerDraggerState();
}

class _PagerDraggerState extends State<PagerDragger> {
  
  Offset dragStartOffset;
  SlideDirection slideDirection;
  double slidePercent;

  void onDragStart(DragStartDetails startDetails) {
    dragStartOffset = startDetails.globalPosition;
  }

  void onDragUpdate(DragUpdateDetails updateDetails) {
    if (dragStartOffset != null) {
      final currentDragPosition = updateDetails.globalPosition;
      final offsetX = currentDragPosition.dx - dragStartOffset.dx;
      
      slideDirection = SlideDirection.none;
      if (offsetX > 0 && widget.canDragLeftToRight) {
        slideDirection = SlideDirection.leftToRight;
      }
      if (offsetX < 0 && widget.canDragRightToLeft) {
        slideDirection = SlideDirection.rightToLeft;
      }

      if (slideDirection != SlideDirection.none) {
        slidePercent = (offsetX / ScreenFactor.instance.physicalSize.width).abs().clamp(0.0, 1.0);
      } else {
        slidePercent = 0.0;
      }
    }

    widget.sliderUpdater.add(
      new SliderState(
        slideDirection,
        slidePercent,
        SliderEventType.doneAnimating
      )
    );
  }

  void onDragEnd(DragEndDetails endDetails) {
    print(endDetails);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: onDragStart,
      onHorizontalDragUpdate: onDragUpdate,
      onHorizontalDragEnd: onDragEnd,
    );
  }
}