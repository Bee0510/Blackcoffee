// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netclan/Utils/Strings.dart';
import 'package:netclan/Utils/colors.dart';

import '../../Utils/size_configure.dart';

Positioned floating_button(
    VoidCallback _toggle,
    Animation<double> _buttonAnimation,
    Animation<double> _translateButton,
    bool _isExpanded) {
  return Positioned(
    bottom: getVerticalSize(16),
    right: getHorizontalSize(16),
    child: Stack(
      alignment: Alignment.bottomRight,
      children: [
        transformer(3.5, 'Notes', _translateButton, Strings.knotes),
        transformer(6.5, 'Jobs', _translateButton, Strings.ksuitcase),
        transformer(18.5, 'Netclan Groups', _translateButton, Strings.khash),
        transformer(15.5, 'Business Cards', _translateButton, Strings.kcard),
        transformer(9.5, 'Buy-Sell-Rent', _translateButton, Strings.kbuy),
        transformer(12.5, 'Matrimony', _translateButton, Strings.kmatrimony),
        transformer(21.5, 'Dating', _translateButton, Strings.kdating),
        FloatingActionButton(
          backgroundColor: Colour.textColor,
          onPressed: _toggle,
          // child: AnimatedBuilder(
          //   animation: _buttonAnimation,
          //   builder: (BuildContext context, child) {
          //     return Transform.rotate(
          //       angle: _buttonAnimation.value * 0.25 * 3.1415926535897932,
          //       child: _isExpanded ? Icon(Icons.close) : Icon(Icons.add),
          //     );
          //   },
          // ),
          child: AnimatedIcon(
              icon: AnimatedIcons.menu_close, progress: _buttonAnimation),
        )
      ],
    ),
  );
}

Transform transformer(
    double time, String text, Animation<double> _translateButton, String icon) {
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
                backgroundColor: Color.fromARGB(255, 255, 179, 0),
                onPressed: () {},
                child: SvgPicture.asset(
                  icon,
                  fit: BoxFit.contain,
                  height: 24,
                ),
              )),
          SizedBox(width: getHorizontalSize(12)),
        ],
      ),
    ),
  );
}
