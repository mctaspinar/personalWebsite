import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/strings.dart';

class Description extends StatelessWidget {
  final double screenSize;
  final bool control;
  final double fontSize;
  Description({this.screenSize, this.control, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(2.0, 0.0), //(x,y)
            blurRadius: 20.0,
          ),
        ],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Text(control ? Strings.descTR : Strings.descEN,
          style: GoogleFonts.comfortaa(
              letterSpacing: 1,
              height: 1.5,
              fontSize: fontSize, //24 for large screen
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(.7)),
          textAlign: TextAlign.center),
    );
  }
}
