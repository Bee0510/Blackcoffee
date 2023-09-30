import 'package:flutter/material.dart';

import '../../Utils/size_configure.dart';

Positioned floating_button(VoidCallback _toggle,
    Animation<double> _buttonAnimation, Animation<double> _translateButton) {
  return Positioned(
    bottom: getVerticalSize(16), // Adjust the vertical position as needed
    right: getHorizontalSize(16),
    child: Stack(
      alignment: Alignment.bottomRight,
      children: [
        transformer(3.5, 'Notes', _translateButton),
        transformer(6.5, 'Jobs', _translateButton),
        transformer(18.5, 'Netclan Groups', _translateButton),
        transformer(15.5, 'Business Cards', _translateButton),
        transformer(9.5, 'Buy-Sell-Rent', _translateButton),
        transformer(12.5, 'Matrimony', _translateButton),
        transformer(21.5, 'Dating', _translateButton),
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

Transform transformer(
    double time, String text, Animation<double> _translateButton) {
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
