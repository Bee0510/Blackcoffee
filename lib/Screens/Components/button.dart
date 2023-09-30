import 'package:flutter/material.dart';

import '../../Utils/colors.dart';

class button extends StatelessWidget {
  const button({
    super.key,
    required GlobalKey<FormState> formkey,
    required this.title,
  }) : _formkey = formkey;

  final GlobalKey<FormState> _formkey;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _formkey.currentState!.save();
      },
      child: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colour.primaryColor,
        minimumSize: Size(100, 36),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
