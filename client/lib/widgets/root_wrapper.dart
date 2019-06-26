import 'package:flutter/material.dart';
import 'package:client/utils/screen_factor.dart';

class RootWrapper extends StatelessWidget {
  final Widget content;

  const RootWrapper({
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    // 初始化屏幕数据的单例，这个组件负责所有全局变量的初始化
    ScreenFactor sf = new ScreenFactor();
    sf.initMediaQueryData(context);

    return new Container(
      child: content,
    );
  }
}