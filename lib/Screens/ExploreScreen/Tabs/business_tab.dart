// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, sort_child_properties_last, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:netclan/Screens/Components/floating_action.dart';
import 'package:netclan/Screens/ExploreScreen/Tabs/PersonalTab/widgets/card.dart';
import 'package:netclan/Utils/size_configure.dart';
import '../../../Utils/colors.dart';
import '../../Components/blur_back.dart';
import '../../Components/search_bar.dart';

class business_tab extends StatefulWidget {
  const business_tab({super.key});

  @override
  State<business_tab> createState() => _business_tabState();
}

class _business_tabState extends State<business_tab>
    with SingleTickerProviderStateMixin {
  List<Map<String, String>> _userList = [
    {
      'name': 'Sashi Sekhar Dwibedi',
      'description': 'Hi communnity! I am open to new connections',
      'coffee': 'Technical Support Executive | Business | Friendship',
      'distance': '4.5 m',
      'det': 'Bokaro Steel Plant, Within 5 KM',
      'shortName': 'SD',
    },
    {
      'name': 'Alok Mishra',
      'description': 'Hi communnity! I am open to new connections',
      'coffee': 'Student | 0 year of experience',
      'distance': '5.7 KM',
      'det': 'Burla, Within 7.9 KM',
      'shortName': 'AM',
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
                        bu_detailed_card(
                          coffee: _userList[index]['coffee'].toString(),
                          description:
                              _userList[index]['description'].toString(),
                          det: _userList[index]['det'].toString(),
                          name: _userList[index]['name'].toString(),
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
            _toggle, _buttonAnimation, _translateButton, _isExpanded)
      ],
    );
  }
}

class bu_detailed_card extends StatefulWidget {
  const bu_detailed_card({
    super.key,
    required this.coffee,
    required this.description,
    required this.det,
    required this.name,
  });
  final String coffee;
  final String description;
  final String name;
  final String det;

  @override
  State<bu_detailed_card> createState() => _bu_detailed_cardState();
}

class _bu_detailed_cardState extends State<bu_detailed_card> {
  bool isInvited = false;

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
          height: getVerticalSize(220),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 2,
                right: 1,
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        isInvited = !isInvited;
                      });
                    },
                    child: Text(
                      isInvited ? 'PENDING' : '+ INVITE',
                      style: TextStyle(
                          color: isInvited == false
                              ? Colour.textColor
                              : Colors.grey,
                          fontSize: getSize(14),
                          fontWeight: FontWeight.w600),
                    )),
              ),
              Positioned(
                  top: 40,
                  left: 60,
                  child: container_1(widget.name, widget.det)),
              Positioned(
                  bottom: 10,
                  left: 20,
                  child: container_2(widget.coffee, widget.description)),
            ],
          ),
        ),
      ),
    );
  }

  Container container_2(String coffee, String description) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 250,
                child: Text(coffee,
                    style: TextStyle(
                        fontSize: getSize(14),
                        color: Colour.textColor,
                        fontWeight: FontWeight.w500)),
              ),
              SizedBox(width: 3),
            ],
          ),
          SizedBox(height: getVerticalSize(5)),
          SizedBox(
            width: 250,
            child: Text(
              description,
              style:
                  TextStyle(fontSize: getSize(14), overflow: TextOverflow.clip),
            ),
          ),
        ],
      ),
    );
  }

  Container container_1(String name, String det) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
                fontSize: getSize(15),
                fontWeight: FontWeight.bold,
                color: Colour.textColor),
          ),
          SizedBox(height: 2.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(det,
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
                        color: Color.fromARGB(255, 83, 94, 102),
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
                backgroundColor: const Color.fromARGB(255, 8, 7, 36),
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
                backgroundColor: const Color.fromARGB(255, 8, 7, 36),
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
