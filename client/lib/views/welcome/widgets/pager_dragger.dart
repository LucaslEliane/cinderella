import 'dart:async';

import 'package:client/views/welcome/widgets/pager_slider.dart';
import 'package:flutter/material.dart';

class PagerDragger extends StatefulWidget {
  final StreamController<SliderState> sliderUpdater;

  PagerDragger(
    this.sliderUpdater
  );

  @override
  _PagerDraggerState createState() => _PagerDraggerState();
}

class _PagerDraggerState extends State<PagerDragger> {
  
  Offset dragStartOffset;

  void onDragStart(DragStartDetails startDetails) {
    dragStartOffset = startDetails.globalPosition;
  }

  void onDragUpdate(DragUpdateDetails updateDetails) {
    final currentPosition = updateDetails.globalPosition;
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