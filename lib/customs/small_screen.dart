import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter_website/utils/strings.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bottom_banner.dart';

class SmallScreen extends StatelessWidget {
  final bool control;
  SmallScreen({Key key, @required this.control}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: CircularProfileAvatar(
            null,
            child: Image.asset(
              "asset/images/pp2.jpg",
              fit: BoxFit.fill,
            ),
            borderColor: Colors.brown[400],
            borderWidth: 4,
            elevation: 10,
            radius: 120,
          ),
          height: 240,
        ),
        SizedBox(
          height: 32,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Strings.name,
                style: GoogleFonts.comfortaa(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 3,
                    color: Colors.brown[700]),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                control ? Strings.hobiler : Strings.hobies,
                style: GoogleFonts.indieFlower(
                    letterSpacing: 3, fontSize: 16, color: Colors.blueGrey),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Divider(
                    height: 1,
                    thickness: 2,
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      control ? Strings.hakkimda : Strings.aboutMe,
                      style: GoogleFonts.comfortaa(
                          fontSize: 28,
                          letterSpacing: 5,
                          fontWeight: FontWeight.w500,
                          color: Colors.brown[700]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    height: 1,
                    thickness: 2,
                  )),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2.0, 0.0), //(x,y)
                      blurRadius: 10.0,
                    ),
                  ],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Text(control ? Strings.descTR : Strings.descEN,
                    style: GoogleFonts.comfortaa(
                        letterSpacing: 1,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(.7)),
                    textAlign: TextAlign.center),
              ),
              BottomBanner(
                control: control,
              )
            ],
          ),
        )
      ],
    );
  }
}
