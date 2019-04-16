import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
    @override
    State<StatefulWidget> createState() {
        return _WelcomeState();
    }
}

class _WelcomeState extends State<Welcome> {
    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                title: const Text('Welcome Cinderella')
            ),
            body: const Text('It is body')
        );
    }
}