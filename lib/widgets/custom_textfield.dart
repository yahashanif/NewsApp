import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/app/themes.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String? labelText;
  final bool isPassword;
  final Widget? preffixIcon;
  final Widget? suffixIcon;
  final double marginBottom;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final Function()? onTap;
  final TextStyle? style;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Color labelcolor;
  final int? maxLength;
  final bool readOnly;
  final List<TextInputFormatter>? textInputFormatter;

  const CustomTextField(
      {Key? key,
      required this.hintText,
      this.labelText,
      this.isPassword = false,
      this.suffixIcon,
      this.labelcolor = primaryMainColor,
      this.preffixIcon,
      this.marginBottom = 24,
      required this.controller,
      this.onChanged,
      this.onSubmit,
      this.validator,
      this.maxLength,
      this.onTap,
      this.textInputFormatter,
      this.readOnly = false,
      this.obscureText = false,
      this.textInputType = TextInputType.text,
      this.textInputAction = TextInputAction.next,
      this.style})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: widget.marginBottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.labelText == null
              ? const SizedBox()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.labelText!,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
          TextFormField(
            validator: widget.validator,
            readOnly: widget.readOnly,
            inputFormatters: widget.textInputFormatter,
            keyboardType: widget.textInputType,
            maxLength: widget.maxLength,
            textInputAction: widget.textInputAction,
            obscureText: widget.obscureText ? isShow : widget.obscureText,
            controller: widget.controller,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                hintText: widget.hintText,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(width: 1.0, color: netralColor40)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.red, width: 2.0),
                ),
                labelText: widget.labelText,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(color: netralColor50, width: 1.0),
                ),
                suffixIcon: (widget.obscureText
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            isShow = !isShow;
                          });
                        },
                        child: Icon(
                            isShow ? Icons.visibility : Icons.visibility_off),
                      )
                    : widget.suffixIcon != null
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [widget.suffixIcon!],
                          )
                        : null),
                prefixIcon: widget.preffixIcon),
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            onFieldSubmitted: widget.onSubmit,
          ),
        ],
      ),
    );
  }
}
