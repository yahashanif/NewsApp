import 'package:flutter/material.dart';
import 'package:news_app/app/themes.dart';
import 'package:news_app/widgets/base_appbar.dart';

import 'card_category.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppbar(title: ""),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          Center(
            child: Text(
              "Lorem Ipsum",
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              ...List.generate(
                  10,
                  (index) => CardCategory(
                        index: index,
                      ))
            ],
          )
        ],
      ),
    );
  }
}
