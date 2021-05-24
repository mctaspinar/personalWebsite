import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter_website/customs/description_widget.dart';
import 'package:flutter_website/utils/strings.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bottom_banner.dart';

class SmallScreen extends StatelessWidget {
  final bool control;
  SmallScreen({Key key, @required this.control}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        FittedBox(
          child: Container(
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
        ),
        SizedBox(
          height: 32,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 48),
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
                    letterSpacing: 3,
                    fontSize:
                        (MediaQuery.of(context).size.width < 360) ? 14 : 16,
                    color: Colors.blueGrey),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 1,
                        width: 100,
                        color: Colors.black45,
                      ),
                    ),
                    Text(
                      control ? Strings.hakkimda : Strings.aboutMe,
                      style: GoogleFonts.comfortaa(
                          fontSize: 24,
                          letterSpacing: 5,
                          fontWeight: FontWeight.w500,
                          color: Colors.brown[700]),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 1,
                        width: 100,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Description(
                control: control,
                screenSize: _screenSize.width,
                fontSize: (_screenSize.width < 360) ? 14 : 16,
              ),
              SizedBox(
                height: 5,
              ),
              // Container(
              //   padding: EdgeInsets.all(10),
              //   decoration: BoxDecoration(
              //     color: Colors.white.withOpacity(.8),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey,
              //         offset: Offset(2.0, 0.0), //(x,y)
              //         blurRadius: 10.0,
              //       ),
              //     ],
              //     shape: BoxShape.rectangle,
              //     borderRadius: BorderRadius.all(Radius.circular(20.0)),
              //   ),
              //   child: Text(control ? Strings.descTR : Strings.descEN,
              //       style: GoogleFonts.comfortaa(
              //           letterSpacing: 1,
              //           height: 1.5,
              //           fontSize:
              //               (MediaQuery.of(context).size.width < 360) ? 14 : 16,
              //           fontWeight: FontWeight.w400,
              //           color: Colors.black.withOpacity(.7)),
              //       textAlign: TextAlign.center),
              // ),
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
