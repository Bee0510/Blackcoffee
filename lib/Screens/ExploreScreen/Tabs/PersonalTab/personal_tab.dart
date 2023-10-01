// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, sort_child_properties_last, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:netclan/Screens/Components/floating_action.dart';
import 'package:netclan/Utils/size_configure.dart';

import '../../../Components/blur_back.dart';
import '../../../Components/search_bar.dart';
import 'widgets/card.dart';

class personal_tab extends StatefulWidget {
  const personal_tab({super.key});

  @override
  State<personal_tab> createState() => _personal_tabState();
}

class _personal_tabState extends State<personal_tab>
    with SingleTickerProviderStateMixin {
  List<Map<String, String>> _userList = [
    {
      'name': 'Biswajit Jena',
      'description': 'Hi communnity! I am open to new connections',
      'coffee': 'Coffee | Business | Friendship',
      'distance': '100 m',
      'det': 'Rourkela | Student',
      'shortName': 'BJ',
    },
    {
      'name': 'RAJAT KUMAR SWAIN',
      'description': 'Hi communnity! I am open to new connections',
      'coffee': 'Friendship| Movie',
      'distance': '100-200 m',
      'det': 'Rourkela | Student',
      'shortName': 'RS',
    },
    {
      'name': 'Vicky Star',
      'description': 'Hi communnity! I am open to new connections',
      'coffee': 'Coffee | Business',
      'distance': '600 m',
      'det': 'Odisha | Student',
      'shortName': 'VS',
    },
    {
      'name': 'Gopi Kishan Behera',
      'description': 'Hi communnity! Gopi here, I am open to new connections',
      'coffee': 'Games | Business | Friendship',
      'distance': '1.2 KM',
      'det': 'Rourkela | Businessman',
      'shortName': 'GB',
    },
    {
      'name': 'Lizarani Dhal',
      'description': 'Hi communnity! Gopi here, I am open to new connections',
      'coffee': 'Chat | Dating | Friendship | Travel',
      'distance': '3.5 KM',
      'det': 'Rourkela | App Developer',
      'shortName': 'LD',
    }
  ];

  late AnimationController _animationController;
  late Animation<double> _translateButton;
  late Animation<double> _buttonAnimation;

  bool _isExpanded = false;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
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
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: _userList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        detailed_card(
                          name: _userList[index]['name'].toString(),
                          det: _userList[index]['det'].toString(),
                          distance: _userList[index]['distance'].toString(),
                          coffee: _userList[index]['coffee'].toString(),
                          description:
                              _userList[index]['description'].toString(),
                        ),
                        Positioned(
                          top: 20,
                          left: 10,
                          child: small_card(
                              short: _userList[index]['shortName'].toString()),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        _isExpanded ? blur_back() : Container(),
        floating_button(
            _toggle, _buttonAnimation, _translateButton, _isExpanded),
      ],
    );
  }
}

class divider extends StatelessWidget {
  const divider({
    super.key,
    required this.width,
    required this.height,
  });
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
      width: width,
      height: height,
    );
  }
}
