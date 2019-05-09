import 'package:flutter/material.dart';
import 'package:client/view_models/welcome.dart';
import 'package:client/views/welcome/widgets/pager_indicator.dart';

final pages = [
  PageViewModel(const Color(0xFFcd344f), 'assets/images/welcome/page1.png'),
  PageViewModel(const Color(0xFFce423a), 'assets/images/welcome/page2.png')
];

class Pages extends StatefulWidget {
  @override
  PagesState createState() => new PagesState();
}
class PagesState extends State<Pages> {
  final PageViewModel viewModel;
  int activeIndex = 0;
  SlideDirection slideDirection = SlideDirection.none;
  double slidePercent = 0.0;

  PagesState({this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          width: double.infinity,
          color: viewModel.color,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Opacity(
              opacity: 1.0,
              child: ListView(
                children: <Widget>[layout(context)],
              ))
      ),
      new PagerIndicator(viewModel: new PagerIndicatorViewModel(pages, 0, SlideDirection.none, 10))
    ]);
  }

  Column layout(BuildContext context) {
    // 类似于 CSS 中的 flex 布局，通过主轴和交叉轴进行布局
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(0.0, 0.0, 0.0),
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
