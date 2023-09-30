// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netclan/Utils/Strings.dart';
import 'package:netclan/Utils/size_configure.dart';

class Searchbar extends StatefulWidget {
  Searchbar({Key? key})
      : super(
          key: key,
        );

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<Searchbar> {
  static TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: getVerticalSize(28),
              width: getHorizontalSize(280),
              margin: EdgeInsets.only(top: 10, left: 14, right: 14),
              padding: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(60),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.2,
                ),
              ),
              child: Center(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  SizedBox(width: getHorizontalSize(10)),
                  Expanded(
                      child: TextField(
                    style: GoogleFonts.lato(color: Colors.grey),
                    controller: searchcontroller,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: GoogleFonts.lato(color: Colors.grey),
                      border: InputBorder.none,
                      alignLabelWithHint: true,
                    ),
                  ))
                ],
              )),
            ),
            InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SvgPicture.asset(
                Strings.kfillter,
                height: 25,
              ),
            ),
            SizedBox(width: 7),
          ],
        ),
      ),
    );
  }
}
