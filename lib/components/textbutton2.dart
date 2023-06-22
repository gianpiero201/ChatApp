import 'package:flutter/material.dart';

class TextButton2 extends StatelessWidget {
  const TextButton2(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.options});
  final void Function() onPressed;
  final String text;
  final TextButtonOptions options;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: options.width,
      height: options.height,
      decoration: BoxDecoration(
          border: Border.fromBorderSide(options.borderSide),
          borderRadius: options.borderRadius),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(options.elevation),
          padding: MaterialStateProperty.all(options.padding),
          backgroundColor: MaterialStateProperty.all(options.color),
        ),
        child: Text(
          text,
          style: options.textStyle,
        ),
      ),
    );
  }
}

class TextButtonOptions {
  final double? width;
  final double? height;
  final EdgeInsetsDirectional? padding;
  final TextStyle? textStyle;
  final double? elevation;
  final BorderSide borderSide;
  final BorderRadius? borderRadius;
  final Color? color;

  TextButtonOptions({
    this.color,
    this.width,
    this.height,
    this.padding,
    this.textStyle,
    this.elevation,
    required this.borderSide,
    this.borderRadius,
  });
}
