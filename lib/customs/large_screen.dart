import 'package:flutter/material.dart';
import 'package:flutter_website/customs/description_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/link.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

import '../customs/social_link.dart';
import '../utils/strings.dart';

class LargeScreen extends StatefulWidget {
  final bool control;
  LargeScreen({Key key, @required this.control}) : super(key: key);

  @override
  _LargeScreenState createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  var colorOfInk;
  var size = 900;

  @override
  void initState() {
    colorOfInk = Colors.brown[400];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: CircularProfileAvatar(
                    null,
                    child: Image.asset(
                      "asset/images/pp2.jpg",
                      fit: BoxFit.fill,
                    ),
                    borderColor: Colors.brown[200],
                    borderWidth: 4,
                    elevation: 10,
                    radius: 170,
                  ),
                  height: 340,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      Strings.name,
                      style: GoogleFonts.comfortaa(
                          fontSize: 52,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 3,
                          color: Colors.brown[700]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.control ? Strings.hobiler : Strings.hobies,
                  style: GoogleFonts.indieFlower(
                      letterSpacing: 3, fontSize: 20, color: Colors.blueGrey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 60,
                ),
                Text(widget.control ? Strings.sosyal : Strings.social,
                    style: GoogleFonts.comfortaa(
                        color: Colors.blueGrey,
                        letterSpacing: 2,
                        fontSize: 16,
                        fontWeight: FontWeight.w200)),
                SizedBox(
                  height: 16,
                ),
                SocialLink(),
              ],
            ),
          ),
          Container(
            color: Colors.grey.withOpacity(.4),
            height: screenSize.height * .7,
            width: 1,
          ),
          SizedBox(
            width: 40,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    widget.control ? Strings.hakkimda : Strings.aboutMe,
                    style: GoogleFonts.comfortaa(
                        fontSize: 52,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 5,
                        color: Colors.brown[700]),
                    textAlign: TextAlign.center,
                  ),
                  margin: EdgeInsets.only(right: 25),
                ),
                SizedBox(
                  height: 24,
                ),
                Description(
                  control: widget.control,
                  fontSize: 24,
                  screenSize: screenSize.width,
                ),
                SizedBox(
                  height: 24,
                ),
                Link(
                  target: LinkTarget.blank,
                  uri: Uri.parse(Strings.cvLink),
                  builder: (context, goToLink) {
                    return InkWell(
                      hoverColor: Colors.transparent,
                      onTap: goToLink,
                      onHover: (value) {
                        setState(() {
                          !value
                              ? colorOfInk = Colors.brown[400]
                              : colorOfInk = Colors.brown[700];
                          print(colorOfInk.toString());
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 25),
                        width: 310,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: colorOfInk,
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              widget.control
                                  ? Strings.cvGoster
                                  : Strings.viewResume,
                              style: GoogleFonts.comfortaa(
                                  fontSize: 24, color: Colors.white),
                              textAlign: TextAlign.center,
                            )),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
