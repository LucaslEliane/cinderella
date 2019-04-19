import 'package:flutter/material.dart';

final pages = [
  PageViewModel(const Color(0xFFcd344f), 'assets/images/welcome/page1.png')
];

class Pages extends StatelessWidget {
  final PageViewModel viewModel;

  Pages({this.viewModel});

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
              )))
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
        )
      ],
    );
  }
}

class PageViewModel {
  final Color color;
  final String heroAssetPath;

  PageViewModel(this.color, this.heroAssetPath);
}
