// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netclan/Utils/colors.dart';

import '../../../../../Utils/size_configure.dart';

class small_card extends StatelessWidget {
  const small_card({
    super.key,
    required this.short,
  });
  final String short;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFB8C5CD),
        borderRadius: BorderRadius.circular(10),
      ),
      width: getHorizontalSize(74),
      height: getVerticalSize(76),
      child: Center(
        child: Text(
          short,
          style: TextStyle(fontSize: 32, color: Colour.textColor),
        ),
      ),
    );
  }
}

class detailed_card extends StatefulWidget {
  const detailed_card(
      {super.key,
      required this.name,
      required this.det,
      required this.distance,
      required this.coffee,
      required this.description});
  final String name;
  final String det;
  final String distance;
  final String coffee;
  final String description;

  @override
  State<detailed_card> createState() => _detailed_cardState();
}

class _detailed_cardState extends State<detailed_card> {
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
          height: getVerticalSize(200),
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
                  child: container_1(
                    widget.name,
                    widget.det,
                    widget.distance,
                  )),
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

  Container container_1(String name, String det, String distance) {
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
          Text(
            'Within ${distance}',
            style: TextStyle(
              fontSize: getSize(14),
              fontWeight: FontWeight.w600,
              color: Colour.textColor,
            ),
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
                    width: 60,
                    height: 12,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 83, 94, 102),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        )),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
