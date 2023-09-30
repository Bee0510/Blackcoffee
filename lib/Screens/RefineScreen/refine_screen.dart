// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:netclan/Screens/Components/button.dart';
import 'package:netclan/Utils/colors.dart';
import 'package:netclan/Utils/size_configure.dart';

class refine_screen extends StatefulWidget {
  const refine_screen({super.key});

  @override
  State<refine_screen> createState() => _refine_screenState();
}

class _refine_screenState extends State<refine_screen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController iconController = TextEditingController();
  final TextEditingController statusController = TextEditingController(
      text: 'Hi Community, I am open to new connections.');
  IconLabel? selectedIcon;
  int _currentStrength = 1;
  bool sample1Toggled = false;
  bool sample2Toggled = false;
  bool sample3Toggled = false;
  bool sample4Toggled = false;
  bool sample5Toggled = false;
  bool sample6Toggled = false;
  bool sample7Toggled = false;
  bool sample8Toggled = false;
  @override
  void dispose() {
    statusController.dispose();
    iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<IconLabel>> iconEntries =
        <DropdownMenuEntry<IconLabel>>[];
    for (final IconLabel icon in IconLabel.values) {
      iconEntries
          .add(DropdownMenuEntry<IconLabel>(value: icon, label: icon.label));
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colour.primaryColor,
        title: Text('Refine'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Select Your Availability',
                style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(156, 3, 20, 31),
                    fontWeight: FontWeight.w600),
              ),
              dropdownbox(iconEntries),
              SizedBox(height: 20),
              Text(
                'Add Your Status',
                style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(156, 3, 20, 31),
                    fontWeight: FontWeight.w600),
              ),
              status(),
              SizedBox(height: 20),
              Text(
                'Select Hybrid Local Distance',
                style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(156, 3, 20, 31),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: getVerticalSize(32)),
              slider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '1 Km',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Text(
                    '100 Km',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Select Purpose',
                style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(156, 3, 20, 31),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  purposebox(),
                  purposebox2(),
                  purposebox3(),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: button(formkey: _formkey, title: 'SAVE AND CONTINUE'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding purposebox() {
    return Padding(
      padding: getPadding(
        left: 5,
        top: 7,
        right: 11,
      ),
      child: Row(
        children: [
          Container(
            padding: getPadding(left: 18, top: 5, right: 18, bottom: 5),
            decoration: BoxDecoration(
              color: sample1Toggled ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.grey,
                width: getHorizontalSize(
                  1,
                ),
              ),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  sample1Toggled = !sample1Toggled;
                });
              },
              child: Text(
                "Coffee",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: sample1Toggled ? Colors.white : Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            padding: getPadding(left: 16, top: 5, right: 16, bottom: 5),
            decoration: BoxDecoration(
              color: sample2Toggled ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.grey,
                width: getHorizontalSize(
                  1,
                ),
              ),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  sample2Toggled = !sample2Toggled;
                });
              },
              child: Text(
                "Business",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: sample2Toggled ? Colors.white : Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            padding: getPadding(left: 17, top: 5, right: 17, bottom: 5),
            decoration: BoxDecoration(
              color: sample3Toggled ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.grey,
                width: getHorizontalSize(
                  1,
                ),
              ),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  sample3Toggled = !sample3Toggled;
                });
              },
              child: Text(
                "Hobbies",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: sample3Toggled ? Colors.white : Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding purposebox2() {
    return Padding(
      padding: getPadding(
        left: 5,
        top: 7,
        right: 11,
      ),
      child: Row(
        children: [
          Container(
            padding: getPadding(left: 18, top: 5, right: 18, bottom: 5),
            decoration: BoxDecoration(
              color: sample4Toggled ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.grey,
                width: getHorizontalSize(
                  1,
                ),
              ),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  sample4Toggled = !sample4Toggled;
                });
              },
              child: Text(
                "Friendship",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: sample4Toggled ? Colors.white : Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            padding: getPadding(left: 16, top: 5, right: 16, bottom: 5),
            decoration: BoxDecoration(
              color: sample5Toggled ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.grey,
                width: getHorizontalSize(
                  1,
                ),
              ),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  sample5Toggled = !sample5Toggled;
                });
              },
              child: Text(
                "Movies",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: sample5Toggled ? Colors.white : Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            padding: getPadding(left: 17, top: 5, right: 17, bottom: 5),
            decoration: BoxDecoration(
              color: sample6Toggled ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.grey,
                width: getHorizontalSize(
                  1,
                ),
              ),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  sample6Toggled = !sample6Toggled;
                });
              },
              child: Text(
                "Dinning",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: sample6Toggled ? Colors.white : Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding purposebox3() {
    return Padding(
      padding: getPadding(
        left: 5,
        top: 7,
        right: 11,
      ),
      child: Row(
        children: [
          Container(
            padding: getPadding(left: 16, top: 5, right: 16, bottom: 5),
            decoration: BoxDecoration(
              color: sample7Toggled ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.grey,
                width: getHorizontalSize(
                  1,
                ),
              ),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  sample7Toggled = !sample7Toggled;
                });
              },
              child: Text(
                "Matrimonial",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: sample7Toggled ? Colors.white : Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            padding: getPadding(left: 17, top: 5, right: 17, bottom: 5),
            decoration: BoxDecoration(
              color: sample8Toggled ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.grey,
                width: getHorizontalSize(
                  1,
                ),
              ),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  sample8Toggled = !sample8Toggled;
                });
              },
              child: Text(
                "Dating",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: sample8Toggled ? Colors.white : Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container status() {
    return Container(
      padding: EdgeInsets.only(top: 2, left: 6, right: 6),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 70,
        width: 335,
        color: Colors.white,
        child: TextFormField(
          style: TextStyle(color: Colors.black, fontSize: 16),
          controller: statusController,
          maxLines: null,
          decoration: InputDecoration(
              hintText: 'Write your letter here...',
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.black, fontSize: 16)),
        ),
      ),
    );
  }

  SliderTheme slider() {
    return SliderTheme(
      data: SliderThemeData(
        rangeThumbShape:
            RoundRangeSliderThumbShape(enabledThumbRadius: 5, elevation: 2),
        thumbColor: Colors.black,
        trackHeight: 1,
      ),
      child: Slider(
        allowedInteraction: SliderInteraction.tapAndSlide,
        label: _currentStrength.toString(),
        activeColor: Colors.black,
        inactiveColor: Colors.grey,
        min: 1,
        max: 100,
        divisions: 100,
        value: _currentStrength.toDouble(),
        onChanged: (value) {
          setState(() {
            _currentStrength = value.round();
          });
        },
      ),
    );
  }

  DropdownMenu<IconLabel> dropdownbox(
      List<DropdownMenuEntry<IconLabel>> iconEntries) {
    return DropdownMenu<IconLabel>(
      controller: iconController,
      enableFilter: true,
      width: 350,
      textStyle: TextStyle(color: Colors.black, fontSize: 16),
      dropdownMenuEntries: iconEntries,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        filled: true,
        focusedBorder: dropdown_border(),
        enabledBorder: dropdown_border(),
        errorBorder: dropdown_border(),
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      ),
    );
  }

  OutlineInputBorder dropdown_border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Colors.grey, width: 1));
  }
}

enum IconLabel {
  smile('Available | Hey Let Us Connect'),
  cloud('Away | Stay Discrete And Watch'),
  brush('Busy | Do Not Disturb | Will Catch Up Later'),
  heart('SOS | Emergency | Need Assistance'),
  mumbai('Sleep | Do not Disturb | No Calls');

  const IconLabel(this.label);
  final String label;
}
