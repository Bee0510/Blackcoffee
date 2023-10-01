// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:netclan/Screens/HomeScreen/home_screen.dart';
import 'package:netclan/Utils/Strings.dart';
import 'package:netclan/Utils/colors.dart';
import 'package:netclan/Utils/size_configure.dart';

class drawer extends StatelessWidget {
  const drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _list = [
      {
        'title': 'Switch to Business',
        'icon': Strings.ksuitcase,
      },
      {
        'title': 'Switch to Merchant',
        'icon': Strings.networkoff,
      },
      {
        'title': 'Dating',
        'icon': Strings.kdating,
      },
      {
        'title': 'Matrimony',
        'icon': Strings.kmatrimony,
      },
      {
        'title': 'Buy-Sell _Rent',
        'icon': Strings.kbuy,
      },
      {
        'title': 'Jobs',
        'icon': Strings.kbuy,
      },
      {
        'title': 'Business Card',
        'icon': Strings.kcard,
      },
      {
        'title': 'Netclan Groups',
        'icon': Strings.khash,
      },
      {
        'title': 'Notes',
        'icon': Strings.knotes,
      },
      {
        'title': 'Live Location',
        'icon': Strings.eyeon,
      },
    ];
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://www.pngall.com/wp-content/uploads/5/Profile-Avatar-PNG.png'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Vishal Behera',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: getSize(18),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'BBROUR004Z000',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: getSize(16),
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 2),
                    Container(
                        width: 120,
                        height: 10,
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(16)),
                        child: Stack(
                          children: [
                            Container(
                              width: 40,
                              height: 12,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    bottomLeft: Radius.circular(16),
                                  )),
                            ),
                          ],
                        )),
                    SizedBox(height: 2),
                    Text(
                      'Available',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: getSize(14),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings, color: Colors.black),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colour.textColor,
            ),
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              // return listTile(_list[index]['title'], _list[index]['icon']);
              return Padding(
                padding: EdgeInsets.only(bottom: 24, left: 10, top: 0),
                child: Row(
                  children: [
                    svg_pics(icon: _list[index]['icon']),
                    SizedBox(width: 16),
                    Text(
                      _list[index]['title'],
                      style: TextStyle(fontSize: 16, color: Colour.textColor),
                    )
                  ],
                ),
              );
            },
            itemCount: _list.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          )
        ],
      ),
    );
  }

  ListTile listTile(String title, String icon) {
    return ListTile(
      leading: svg_pics(icon: icon),
      title: Text(title),
    );
  }
}
