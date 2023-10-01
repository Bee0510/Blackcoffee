import 'package:flutter/material.dart';

class group_screen extends StatelessWidget {
  const group_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Text(
          'Group Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
