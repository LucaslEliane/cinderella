import 'package:flutter/material.dart';
import 'package:client/views/welcome/welcome_page.dart';
import 'package:client/utils/screen_factor.dart';

class Welcome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WelcomeState();
  }
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    ScreenFactor.instance;
    return SafeArea(
      top: false,
      right: false,
      bottom: false,
      left: false,
      child: new Container(
        child: new Align(
          alignment: Alignment.center,
          widthFactor: 2,
          heightFactor: 2,
          child: new WelcomePage(),
        ),
      ),
    );
  }
}
