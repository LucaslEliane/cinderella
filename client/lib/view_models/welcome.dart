import 'package:flutter/material.dart';

class PageViewModel {
  final Color color;
  final String heroAssetPath;

  PageViewModel(
    this.color,
    this.heroAssetPath
  );
}

enum SlideDirection {
  leftToRight,
  rightToLeft,
  none
}

class PagerIndicatorViewModel {
  final List<PageViewModel> pages;
  final int activeIndex;
  final double slidePercent;
  final SlideDirection slideDirection;

  PagerIndicatorViewModel(
    this.pages,
    this.activeIndex,
    this.slideDirection,
    this.slidePercent
  );
}

class PagerIndicatorBubbleViewModel {
  final Color color;
  final double activePercent;

  PagerIndicatorBubbleViewModel(
    this.color,
    this.activePercent
  );
}
