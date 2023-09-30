// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:netclan/Screens/Components/button.dart';
import 'package:netclan/Screens/Components/floating_action.dart';
import 'package:netclan/Utils/Strings.dart';
import 'package:netclan/Utils/size_configure.dart';
import '../../Components/blur_back.dart';
import '../../Components/search_bar.dart';

class merchant_tab extends StatefulWidget {
  const merchant_tab({super.key});

  @override
  State<merchant_tab> createState() => _merchant_tabState();
}

class _merchant_tabState extends State<merchant_tab>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _translateButton;
  late Animation<double> _buttonAnimation;

  bool _isExpanded = false;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _buttonAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _translateButton = Tween<double>(begin: 100.0, end: -20.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    super.initState();
  }

  _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
      _isExpanded
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Stack(
      children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: getVerticalSize(6),
                  right: getHorizontalSize(10),
                  left: getHorizontalSize(10)),
              decoration: BoxDecoration(color: Colors.white),
              child: Searchbar(),
            ),
            Container(
              height: getVerticalSize(200),
              child: Image.asset(Strings.khamster, fit: BoxFit.cover),
            ),
            Center(
              child: Container(
                // decoration: BoxDecoration(color: Colors.amber),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Your explore list is',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'EMPTY',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                child: Column(
                  children: [
                    Text(
                      'Sorry, we could not find any user near you',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Try increasing your search radius',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: button(formkey: _formkey, title: 'INCREASE RADIUS'),
            )
          ],
        ),
        _isExpanded ? blur_back() : Container(),
        floating_button(_toggle, _buttonAnimation, _translateButton)
      ],
    );
  }
}
