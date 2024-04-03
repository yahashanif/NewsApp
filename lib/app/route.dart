import 'package:flutter/material.dart';
import 'package:news_app/pages/category/category_screen.dart';
import 'package:news_app/pages/login/login_screen.dart';
import 'package:news_app/pages/main/main_page.dart';

import '../pages/splash/splash_screen.dart';

const splash = '/';
const login = '/login';
// const categoryRoute = '/category';
const mainRoute = '/main';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
            builder: (context) => MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: const SplashScreen()));
      case login:
        return MaterialPageRoute(
            builder: (context) => MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: const LoginScreen()));
      // case categoryRoute:
      //   return MaterialPageRoute(
      //       builder: (context) => MediaQuery(
      //           data: MediaQuery.of(context)
      //               .copyWith(textScaler: const TextScaler.linear(1.0)),
      //           child: const CategoryScreen()));
      case mainRoute:
        return MaterialPageRoute(
            builder: (context) => MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: const MainPage()));
      default:
        return MaterialPageRoute(
            builder: (context) => MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: const Scaffold()));
    }
  }
}
