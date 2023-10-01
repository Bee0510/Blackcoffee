// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_field, prefer_final_fields, avoid_unnecessary_containers

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netclan/Screens/ChatScreen/chat_screen.dart';
import 'package:netclan/Screens/ContactsScreen/contacts_screen.dart';
import 'package:netclan/Screens/ExploreScreen/explore_screen.dart';
import 'package:netclan/Screens/GroupScreen/group_screen.dart';
import 'package:netclan/Screens/NetworkScreen/network_screen.dart';
import 'package:netclan/Screens/RefineScreen/refine_screen.dart';
import 'package:netclan/Utils/Strings.dart';
import 'package:netclan/Utils/colors.dart';
import 'package:netclan/Utils/size_configure.dart';

import '../Components/drawer.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isExpanded = false;
  late List<Widget> _pages = [
    explore_screen(),
    network_screen(),
    chat_screen(),
    contact_screen(),
    group_screen(),
  ];
  int _currentIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _translateButton;
  late Animation<double> _buttonAnimation;

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colour.primaryColor,
        title: Container(
          height: getVerticalSize(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: getHorizontalSize(2),
                  ),
                  Text(
                    'Howdy Vishal Behera!!',
                    style: TextStyle(
                        fontSize: getSize(16),
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: getVerticalSize(4),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    Strings.klocation,
                    height: getHorizontalSize(12),
                  ),
                  Text('Sector 1, Rourkela',
                      style: TextStyle(
                        fontSize: getSize(12),
                        color: Colors.white,
                      )),
                ],
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon: SvgPicture.asset(
            Strings.khamburger,
            height: 60,
          ),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        actions: [
          Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    Strings.kchecklist,
                    height: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => refine_screen()));
                  },
                ),
                Positioned(
                  bottom: 2,
                  right: 6,
                  child: Text(
                    'Refine',
                    style:
                        TextStyle(color: Colors.white, fontSize: getSize(12)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: drawer(),
      body: Stack(
        children: [
          _pages[_currentIndex],
        ],
      ),
      bottomNavigationBar: bottom_navbar(context),
    );
  }

  SizedBox bottom_navbar(BuildContext context) {
    return SizedBox(
      height: getVerticalSize(52),
      child: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        enableFeedback: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Theme.of(context).hintColor,
        selectedIconTheme: IconThemeData(size: 20),
        backgroundColor: Colors.white,
        iconSize: 20,
        type: BottomNavigationBarType.fixed,
        elevation: 16,
        items: [
          bottom_navbar_items('Explore', Strings.eyeoff, Strings.eyeon),
          bottom_navbar_items('Network', Strings.networkoff, Strings.networkon),
          bottom_navbar_items('Chat', Strings.chatoff, Strings.chaton),
          bottom_navbar_items(
              'Contacts', Strings.contactoff, Strings.contacton),
          bottom_navbar_items('Groups', Strings.hash, Strings.hash),
        ],
      ),
    );
  }

  BottomNavigationBarItem bottom_navbar_items(
      String title, String icon, String activeIcon) {
    return BottomNavigationBarItem(
      label: title,
      icon: svg_pics(icon: icon),
      activeIcon: svg_pics(icon: activeIcon),
    );
  }
}

class svg_pics extends StatelessWidget {
  const svg_pics({
    super.key,
    required this.icon,
  });
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      fit: BoxFit.contain,
      height: getSize(24),
      color: Colour.textColor,
    );
  }
}
