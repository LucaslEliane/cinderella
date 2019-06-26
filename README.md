# Cinderella

## A Reading Recorder Based on Egg.js and Flutter.

## Description

* Egg.js: Providing backend services to client, including data storage or data synchronization, etc.
* Flutter: Providing client UI interface and interactive functions.

## Startup Project

```
$ git clone ${git://project}
$ cd ${PROJECT_PATH}/client
$ flutter packages get
```

## Directory

```
client
├─ .flutter-plugins
├─ .gitignore
├─ README.md
├─ android/..
├─ assets                                           // 资源文件，按照路由命名
│    └─ images
│           └─ welcome
├─ ios/..
├─ lib
│    ├─ constants                                   // 静态变量
│    │    └─ color.dart
│    ├─ main.dart                                   // App 入口文件
│    ├─ models                                      // sqlite 数据模型
│    │    └─ user.dart
│    ├─ routers                                     // 路由及相关配置文件
│    │    ├─ application.dart
│    │    ├─ router_handler.dart
│    │    └─ routes.dart
│    ├─ utils                                       // 公共 utils
│    │    ├─ provider.dart
│    │    └─ screen_factor.dart
│    ├─ view_models                                 // 每个路由下的数据模型
│    │    └─ welcome.dart
│    └─ views                                       // 每个路由下的 Home Page
│           ├─ home
│           └─ welcome
├─ pubspec.lock
├─ pubspec.yaml                                     // flutter依赖
└─ test
       └─ widget_test.dart                          // Unit Test 
```