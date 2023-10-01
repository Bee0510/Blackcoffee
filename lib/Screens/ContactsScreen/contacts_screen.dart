import 'package:flutter/material.dart';

class contact_screen extends StatelessWidget {
  const contact_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Text(
          'Contacts Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
