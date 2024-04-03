import 'package:flutter/material.dart';

import '../../app/themes.dart';

class CardCategory extends StatelessWidget {
  final int index;

  const CardCategory({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.orange),
          borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      height: 120,
      width: (MediaQuery.of(context).size.width / 2) - 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lorem Ipsum",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "24 Year",
            style: TextStyle(fontSize: 14),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: CircleAvatar(
              backgroundColor: primaryMainColor,
              child: Text(
                index.toString(),
                style: TextStyle(color: netralColor10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
