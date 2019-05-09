import 'package:client/routers/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'constants/color.dart';
import 'utils/provider.dart';
import 'utils/screen_factor.dart';
import 'routers/application.dart';

var database;
var screen;

void main() async {
    // 初始化 database，其实单例模式也没必要初始化全局DB
    database = DatabaseProvider.db;
    screen = ScreenFactor.screen;
    
    runApp(new Cinderella());
}

class Cinderella extends StatelessWidget {
  Cinderella() {
    final router = new Router();
    // 初始化项目，进行路由初始化配置
    Routes.configureRoutes(router);
    Application.router = router;
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 设置应用主题色
    MaterialColor themeLightPink = MaterialColor(0xFFF0EBE5, MorandiColor.lightPink);

    return MaterialApp(
      title: 'Cinderella',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: themeLightPink,
      ),
      onGenerateRoute: Application.router.generator,
    );
  }
}