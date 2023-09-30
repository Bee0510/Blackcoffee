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
    return SafeArea(
      child: Scaffold(
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
                      'Howdy Bee Bee!!',
                      style: TextStyle(
                          fontSize: getSize(15),
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
            // _isExpanded
            //     ? BackdropFilter(
            //         filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            //         child: Container(
            //           color: Colors.white.withOpacity(0),
            //         ),
            //       )
            //     : Container(),
          ],
        ),
        bottomNavigationBar: bottom_navbar(context),
        // floatingActionButton: _currentIndex == 0 ? floating_button() : null,
      ),
    );
  }

  Positioned floating_button() {
    return Positioned(
      bottom: getVerticalSize(16), // Adjust the vertical position as needed
      right: getHorizontalSize(16),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          transformer(3.5, 'Notes'),
          transformer(6.5, 'Jobs'),
          transformer(18.5, 'Netclan Groups'),
          transformer(15.5, 'Business Cards'),
          transformer(9.5, 'Buy-Sell-Rent'),
          transformer(12.5, 'Matrimony'),
          transformer(21.5, 'Dating'),
          FloatingActionButton(
            backgroundColor: const Color.fromARGB(156, 6, 21, 46),
            onPressed: _toggle,
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _buttonAnimation,
            ),
          ),
        ],
      ),
    );
  }

  Transform transformer(double time, String text) {
    return Transform(
      transform: Matrix4.translationValues(
        0,
        _translateButton.value * time,
        0,
      ),
      child: Container(
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(width: getHorizontalSize(16)),
            Container(
                height: 40,
                width: 40,
                child: FloatingActionButton(
                    backgroundColor: Color.fromARGB(156, 255, 179, 0),
                    onPressed: () {},
                    child: Icon(Icons.add))),
            SizedBox(width: getHorizontalSize(12)),
          ],
        ),
      ),
    );
  }

  Drawer drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Item 1'),
          ),
          ListTile(
            title: Text('Item 2'),
          ),
        ],
      ),
    );
  }

  SizedBox bottom_navbar(BuildContext context) {
    return SizedBox(
      height: getVerticalSize(52),
      child: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
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
          BottomNavigationBarItem(
            label: 'Explore',
            icon: Icon(Icons.remove_red_eye),
            activeIcon: Icon(
              Icons.remove_red_eye,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Network',
            icon: Icon(Icons.cyclone),
            activeIcon: Icon(
              Icons.home_filled,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Chat',
            icon: Icon(Icons.chat),
            activeIcon: Icon(
              Icons.home_filled,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Contacts',
            icon: Icon(Icons.contacts),
            activeIcon: Icon(
              Icons.widgets,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Groups',
            icon: Icon(Icons.people),
            activeIcon: Icon(
              Icons.mail,
            ),
          ),
        ],
      ),
    );
  }
}
