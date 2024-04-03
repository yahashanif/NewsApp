import 'package:flutter/material.dart';
import 'package:news_app/pages/category/category_screen.dart';
import 'package:news_app/pages/news/news_page.dart';

class BlokMainPage extends StatelessWidget {
  final int page;

  const BlokMainPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    switch (page) {
      case 0:
        return CategoryScreen();
      default:
        return NewPage();
    }
  }
}
