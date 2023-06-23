import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String name;
  final String message;
  final bool left;

  const Message({
    super.key,
    required this.left,
    required this.name,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 209, 196, 233),
        borderRadius: BorderRadius.only(
          bottomLeft:
              left ? const Radius.circular(0) : const Radius.circular(16),
          bottomRight:
              !left ? const Radius.circular(0) : const Radius.circular(16),
          topLeft: const Radius.circular(16),
          topRight: const Radius.circular(16),
        ),
        shape: BoxShape.rectangle,
        border: Border.all(
            width: 1, color: const Color.fromARGB(255, 209, 196, 233)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              (left ? "$name: " : "") + message,
              softWrap: true,
              textAlign: left ? TextAlign.start : TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
