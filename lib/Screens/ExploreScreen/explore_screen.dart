// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netclan/Screens/Components/search_bar.dart';
import 'package:netclan/Screens/ExploreScreen/Tabs/PersonalTab/personal_tab.dart';
import 'package:netclan/Screens/ExploreScreen/Tabs/business_tab.dart';
import 'package:netclan/Screens/ExploreScreen/Tabs/merchant_tab.dart';
import 'package:netclan/Utils/colors.dart';
import 'package:netclan/Utils/size_configure.dart';

class explore_screen extends StatefulWidget {
  const explore_screen({super.key});

  @override
  State<explore_screen> createState() => _explore_screenState();
}

class _explore_screenState extends State<explore_screen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  List<String> genres_item = [
    'Personal',
    'Business',
    'Merchant',
  ];
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void tabChange(int tabIndex) {
    _tabController?.animateTo(tabIndex);
  }

  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      child: Column(
        children: [
          Column(
            children: [
              top_navbar(context),
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  TabBarView(
                    controller: _tabController,
                    children: [
                      InkWell(onTap: () => tabChange(0), child: personal_tab()),
                      InkWell(onTap: () => tabChange(1), child: business_tab()),
                      InkWell(onTap: () => tabChange(2), child: merchant_tab()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container top_navbar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: getVerticalSize(44),
      decoration: BoxDecoration(color: Colour.secondaryColor),
      child: TabBar(
        unselectedLabelColor: Color.fromRGBO(176, 180, 182, 100),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.white,
        indicatorWeight: 1,
        isScrollable: false,
        controller: _tabController,
        tabs: [
          _tabView(genres_item[0]),
          _tabView(genres_item[1]),
          _tabView(genres_item[2]),
        ],
      ),
    );
  }

  Tab _tabView(String genre_text) {
    return Tab(
        child: Text(genre_text,
            style: TextStyle(
                fontSize: getSize(16),
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.fade)));
  }
}
