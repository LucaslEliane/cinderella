import 'package:client/routers/router_handler.dart';
import 'package:fluro/fluro.dart';

class Routes {
    static String root = "/";
    static String home = "/home";

    static void configureRoutes(Router router) {
        router.define(home, handler: homeHandler);
    }
}