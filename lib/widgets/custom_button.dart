import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app/themes.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? buttonColor;
  final Color textColor;
  final Color borderColor;
  final double paddingVertical;
  final double width;
  final Function()? onPressed;
  final double fontTextSize;
  final double marginBottom;
  final double marginTop;
  final double iconHeight;
  final FontWeight fontWeight;
  final String? iconUrl;
  final bool iconLeft;

  const CustomButton({
    Key? key,
    required this.text,
    this.buttonColor = primaryMainColor,
    this.textColor = netralColor10,
    this.borderColor = primaryMainColor,
    this.width = double.maxFinite,
    required this.onPressed,
    this.fontTextSize = 15,
    this.marginBottom = 0,
    this.iconHeight = 15,
    this.paddingVertical = 11,
    this.marginTop = 0,
    this.fontWeight = FontWeight.w500,
    this.iconUrl,
    this.iconLeft = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.only(bottom: marginBottom, top: marginTop),
      child: Center(
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            backgroundColor: onPressed != null ? buttonColor : netralColor30,
            disabledBackgroundColor: netralColor30,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: onPressed != null
                  ? BorderSide(
                      color: borderColor,
                    )
                  : BorderSide.none,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconLeft
                  ? iconUrl != null
                      ? Row(
                          children: [
                            SvgPicture.asset(
                              iconUrl!,
                              height: iconHeight,
                            ),
                            SizedBox(
                              width: 4,
                            )
                          ],
                        )
                      : const SizedBox()
                  : const SizedBox(),
              Text(
                text,
                style: TextStyle(fontSize: fontTextSize, color: textColor),
              ),
              iconLeft == false
                  ? iconUrl != null
                      ? Row(
                          children: [
                            SizedBox(
                              width: 4,
                            ),
                            SvgPicture.asset(
                              iconUrl!,
                              height: iconHeight,
                            ),
                          ],
                        )
                      : const SizedBox()
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
