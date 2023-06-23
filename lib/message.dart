import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String name;
  final String message;

  const Message({
    super.key,
    required this.name,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(16),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        shape: BoxShape.rectangle,
        border: Border.all(
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Text(name),
          Text(message),
        ],
      ),
    );
  }
}
