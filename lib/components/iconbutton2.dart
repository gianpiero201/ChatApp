import 'package:flutter/material.dart';

class IconButton2 extends StatelessWidget {
  final Color borderColor;
  final double borderRadius;
  final double buttonSize;
  final Color fillColor;
  final Icon icon;
  final double? borderWidth;

  final void Function()? onPressed;

  const IconButton2({
    super.key,
    this.onPressed,
    this.borderWidth,
    required this.borderColor,
    required this.borderRadius,
    required this.buttonSize,
    required this.fillColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: BoxDecoration(
          border: Border.all(width: borderWidth ?? 0, color: borderColor),
          color: fillColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
      child: IconButton(
        iconSize: 150,
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}
