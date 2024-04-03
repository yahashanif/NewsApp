import 'package:flutter/material.dart';

import 'blok_page_main.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories'), // Menambahkan label untuk item pertama
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'), // Menambahkan label untuk item kedua
        ],
      ),
      body: BlokMainPage(
        page: index,
      ),
    );
  }
}
