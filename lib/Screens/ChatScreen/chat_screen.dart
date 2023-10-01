import 'package:flutter/material.dart';

class chat_screen extends StatelessWidget {
  const chat_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Text(
          'Chat Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
