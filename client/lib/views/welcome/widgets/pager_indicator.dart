import 'package:client/view_models/welcome.dart';
import 'package:flutter/material.dart';

import 'package:client/utils/screen_factor.dart';

class PagerIndicator extends StatelessWidget {
  final PagerIndicatorViewModel viewModel;

  PagerIndicator({
    this.viewModel
  });

  @override
  Widget build(BuildContext context) {
    List<PagerIndicatorBubble> bubbles = [];
    final EdgeInsets devicePadding = ScreenFactor.instance.devicePadding;

    for (var i = 0; i < viewModel.pages.length; i++) {
      final page = viewModel.pages[i];

      bubbles.add(new PagerIndicatorBubble(
        viewModel: new PagerIndicatorBubbleViewModel(Colors.white, viewModel.slidePercent),
      ));
    }

    return new Container(
      padding: devicePadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: bubbles
      )
    );
  }
}

class PagerIndicatorBubble extends StatelessWidget {
  final PagerIndicatorBubbleViewModel viewModel;

  PagerIndicatorBubble({
    this.viewModel
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 10,
      height: 10,
      child: new ClipOval(
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              child: new Container(
                color: Colors.white
              ),
              flex: this.doublePercentToInt(viewModel.activePercent)
            ),
            new Expanded(
              child: new Container(
                color: Colors.black
              ),
              flex: 100 - this.doublePercentToInt(viewModel.activePercent)
            )
          ],
        )
      ),
    );
  }

  int doublePercentToInt(double percent) {
    print(percent);
    return (percent * 100).round();
  }
}

