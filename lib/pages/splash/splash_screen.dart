import 'package:flutter/material.dart';
import 'package:news_app/app/route.dart';
import 'package:news_app/app/themes.dart';
import 'package:news_app/widgets/backgorund.dart';

import '../../widgets/custom_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 74, 18, 109),
        body: Stack(
          children: [
            ClipPath(
              clipper: BottomLeftToRightWaveClipper(),
              child: Container(
                width: double.infinity,
                color: Colors.purple,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "EDUCATION",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Image.asset("assets/images/book.png"),
                  const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  CustomButton(
                    textColor: primaryMainColor,
                    onPressed: () {
                      Navigator.pushNamed(context, login);
                    },
                    buttonColor: netralColor10,
                    text: "Start",
                    fontTextSize: 20,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
