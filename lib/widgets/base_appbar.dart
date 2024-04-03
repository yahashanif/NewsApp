// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../app/themes.dart';
import 'curve_appbar.dart';

class BaseAppbar extends StatelessWidget implements PreferredSizeWidget {
  final double toolheight;
  final String title;
  final Color color;
  final bool backSHow;

  const BaseAppbar(
      {Key? key,
      this.toolheight = 1,
      required this.title,
      this.color = primaryMainColor,
      this.backSHow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      automaticallyImplyLeading: backSHow,
      flexibleSpace: Stack(
        children: [
          ClipPath(
            clipper: CurveAppBar(),
            child: Container(
              height: double.infinity,
              color: color,
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ))
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(toolheight * kToolbarHeight);
}
