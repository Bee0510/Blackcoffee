// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class network_screen extends StatelessWidget {
  const network_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Text(
          'Network Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
