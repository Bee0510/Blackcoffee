// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:netclan/Utils/size_configure.dart';

import '../../Utils/colors.dart';

class button extends StatelessWidget {
  const button({
    super.key,
    required GlobalKey<FormState> formkey,
    required this.title,
    required this.fun,
  }) : _formkey = formkey;

  final GlobalKey<FormState> _formkey;
  final String title;
  final VoidCallback fun;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: fun,
      child: Text(
        title,
        style: TextStyle(fontSize: getSize(15), fontWeight: FontWeight.w500),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 6, 5, 63),
        minimumSize: Size(120, 36),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
