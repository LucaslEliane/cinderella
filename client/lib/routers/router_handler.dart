
import 'package:client/views/home/home.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return new Home();
    }
);