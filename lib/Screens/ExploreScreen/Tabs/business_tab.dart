// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:netclan/Screens/Components/floating_action.dart';
import 'package:netclan/Utils/size_configure.dart';
import '../../Components/blur_back.dart';
import '../../Components/search_bar.dart';

class business_tab extends StatefulWidget {
  const business_tab({super.key});

  @override
  State<business_tab> createState() => _business_tabState();
}

class _business_tabState extends State<business_tab>
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
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        detailed_card(),
                        Positioned(
                          top: 20,
                          left: 10,
                          child: small_card(),
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
        floating_button(_toggle, _buttonAnimation, _translateButton)
      ],
    );
  }
}

class small_card extends StatelessWidget {
  const small_card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(156, 46, 54, 59),
        borderRadius: BorderRadius.circular(10),
      ),
      width: getHorizontalSize(74),
      height: getVerticalSize(76),
      child: Center(
        child: Text('RS', style: TextStyle(fontSize: 32)),
      ),
    );
  }
}

class detailed_card extends StatelessWidget {
  const detailed_card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 36),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          width: getHorizontalSize(360),
          height: getVerticalSize(200),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 2,
                right: 1,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      '+ INVITE',
                      style: TextStyle(
                          color: Color.fromARGB(156, 0, 5, 8),
                          fontSize: getSize(15)),
                    )),
              ),
              Positioned(top: 40, left: 60, child: container_1()),
              Positioned(bottom: 10, left: 20, child: container_2()),
            ],
          ),
        ),
      ),
    );
  }

  Container container_2() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Technical Support Executive',
                  style: TextStyle(
                      fontSize: getSize(14),
                      // color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.clip)),
              SizedBox(width: 3),
              divider(width: 2, height: 15),
              SizedBox(width: 3),
              Text('1 year of Experience',
                  style: TextStyle(
                      fontSize: getSize(14),
                      // color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.clip)),
            ],
          ),
          SizedBox(height: getVerticalSize(5)),
          SizedBox(
            width: 250,
            child: Text(
              'Hi, community! I am available at your service',
              style: TextStyle(fontSize: 14, overflow: TextOverflow.clip),
            ),
          ),
        ],
      ),
    );
  }

  Container container_1() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Sashi Shekhar Dwibedi',
            style:
                TextStyle(fontSize: getSize(15), fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Bokaro Steel City, Within 4.5 KM',
                  style: TextStyle(
                      fontSize: getSize(14),
                      color: Colors.grey,
                      fontWeight: FontWeight.w400)),
            ],
          ),
          SizedBox(height: 2.5),
          Container(
              width: 120,
              height: 10,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(16)),
              child: Stack(
                children: [
                  Container(
                    width: 75,
                    height: 12,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        )),
                  ),
                ],
              )),
          SizedBox(height: 2.5),
          Row(
            children: [
              SizedBox(width: 20),
              CircleAvatar(
                radius: 16,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.phone,
                      size: 18,
                    )),
              ),
              SizedBox(width: 13),
              CircleAvatar(
                radius: 16,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.people,
                      size: 18,
                    )),
              ),
            ],
          )
        ],
      ),
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
