import 'dart:async';

import 'package:client/utils/screen_factor.dart';
import 'package:client/views/welcome/widgets/pager_animation.dart';
import 'package:flutter/material.dart';
import 'package:client/view_models/welcome.dart';
import 'package:client/views/welcome/widgets/pager_indicator.dart';
import 'package:client/views/welcome/widgets/pager_slider.dart';
import 'package:client/views/welcome/widgets/pager_dragger.dart';

final pages = [
  PageViewModel(const Color(0xFFcd344f), 'assets/images/welcome/page1.png'),
  PageViewModel(const Color(0xFFce423a), 'assets/images/welcome/page2.jpeg')
];

class Pages extends StatefulWidget {
  @override
  PagesState createState() => new PagesState();
}
class PagesState extends State<Pages> with TickerProviderStateMixin {
  StreamController sliderUpdater;
  int activeIndex = 0;
  int maxIndex = pages.length;
  SlideDirection slideDirection = SlideDirection.none;
  double slidePercent = 0.0;
  DragAnimation dragAnimation;

  PageViewModel viewModel = pages[0];

  PagesState() {
    sliderUpdater = new StreamController<SliderState>();

    sliderUpdater.stream.listen(onDrag);
  }

  SlideDirection reverseSlideDirection(SlideDirection slideDirection) {
    if (slideDirection == SlideDirection.leftToRight) {
      return SlideDirection.rightToLeft;
    }
    if (slideDirection == SlideDirection.rightToLeft) {
      return SlideDirection.leftToRight;
    }
    return SlideDirection.none;
  }

  void onDrag(dynamic event) {
    SliderState state = event;
    if (mounted) {
      setState(() {
        final SliderEventType eventType = state.sliderEventType;
        final double currentSlidePercent = state.slidePercent;
        final SlideDirection currentDirection = state.direction;

        switch (eventType) {
          case SliderEventType.dragging:
            slideDirection = currentDirection;
            slidePercent = this.getNextSliderPercent(currentDirection, currentSlidePercent);
            break;
          case SliderEventType.doneDragging:
            final currentSlidePercent = state.slidePercent;
            if (currentSlidePercent > 0.5) {
              dragAnimation = new DragAnimation(
                slideDirection: currentDirection,
                slidePercent: currentSlidePercent,
                slidePercentGoal: 1,
                sliderUpdater: sliderUpdater,
                vsync: this
              );
            } else {
              dragAnimation = new DragAnimation(
                slideDirection: currentDirection,
                slidePercent: currentSlidePercent,
                slidePercentGoal: 0,
                sliderUpdater: sliderUpdater,
                vsync: this
              );
            }

            dragAnimation.run();
            break;
          case SliderEventType.doneAnimating:
            if (currentDirection == SlideDirection.leftToRight && activeIndex < maxIndex - 1) {
              activeIndex += 1;
            }
            if (currentDirection == SlideDirection.rightToLeft && activeIndex > 0) {
              activeIndex -= 1;
            }
            viewModel = pages[activeIndex];
            break;
          case SliderEventType.animating:
            slideDirection = currentDirection;
            slidePercent = this.getNextSliderPercent(currentDirection, currentSlidePercent);
            break;
        }
      });
    }
  }

  double getNextSliderPercent(SlideDirection slideDirection, double slidePercent) {
    if (slideDirection == SlideDirection.leftToRight) {
      return -slidePercent;
    }
    if (slideDirection == SlideDirection.rightToLeft) {
      return slidePercent;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets devicePadding = ScreenFactor.instance.devicePadding;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: viewModel.color,
          padding: devicePadding,
          child: Opacity(
            opacity: 1.0,
            child: ListView(
              children: <Widget>[layout(context)],
            )
          )
        ),
        new PagerIndicator(viewModel: new PagerIndicatorViewModel(pages, activeIndex, slideDirection, slidePercent)),
        new PagerDragger(sliderUpdater, true, true)
      ],
      alignment: AlignmentDirectional.bottomCenter,
    );
  }

  Column layout(BuildContext context) {

    // 类似于 CSS 中的 flex 布局，通过主轴和交叉轴进行布局
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(0.0, ScreenFactor.instance.logicalSize.height * slidePercent * 0.5, 0.0),
          child: Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
            child: Image.asset(viewModel.heroAssetPath,
                width: 160.0, height: 160.0),
          ),
        ),
      ],
    );
  }
}
