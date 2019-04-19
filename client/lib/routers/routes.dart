import 'package:client/routers/router_handler.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static String welcome = "/";
  static String home = "/home";

  static void configureRoutes(Router router) {
    router.define(home, handler: homeHandler);
    router.define(welcome, handler: welcomeHandler);
  }
}
