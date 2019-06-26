
import 'package:client/views/home/home.dart';
import 'package:client/views/welcome/welcome.dart';
import 'package:client/widgets/root_wrapper.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new RootWrapper(
      content: new Home(),
    );
  }
);

var welcomeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new RootWrapper(
      content: new Welcome(),
    );
  }
);

