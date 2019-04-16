import 'package:flutter/material.dart';
import 'package:client/views/welcome/widgets/pages.dart';

class WelcomePage extends StatefulWidget {
    @override
    _WelcomePageState createState() => new _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
    _WelcomePageState() {

    }

    @override
    Widget build(BuildContext context) {
        return new Stack(
            children: <Widget>[
                new Pages(
                    viewModel: pages[0]
                )
            ],
        );
    }
}