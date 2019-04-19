import 'package:flutter/material.dart';
import 'package:client/views/welcome/welcome_page.dart';

class Welcome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WelcomeState();
  }
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Container(color: Colors.white, child: WelcomePage()),
    );
  }
}
