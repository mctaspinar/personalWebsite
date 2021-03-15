import 'package:flutter/material.dart';
import 'package:flutter_website/utils/strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

class LargeScreen extends StatefulWidget {
  final bool control;
  LargeScreen({Key key, @required this.control}) : super(key: key);

  @override
  _LargeScreenState createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
    return Row(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () => _launchURL(Strings.fb),
                    child: Image.asset(
                      "asset/images/fb.png",
                      height: 48,
                      width: 48,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () => _launchURL(Strings.ig),
                    child: Image.asset(
                      "asset/images/ig.png",
                      height: 48,
                      width: 48,
                      color: Colors.pink.withOpacity(.6),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () => _launchURL(Strings.tw),
                    child: Image.asset(
                      "asset/images/twitter.png",
                      height: 48,
                      width: 48,
                      color: Colors.blue.shade400,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () => _launchURL(Strings.lin),
                    child: Image.asset(
                      "asset/images/lin.png",
                      height: 48,
                      width: 48,
                      color: Colors.lightBlue.shade900,
                    ),
                  ),
                ],
              ),
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
              Container(
                margin: EdgeInsets.only(right: 25),
                width: screenSize.width * .45,
                padding: EdgeInsets.all(20),
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
                child: Text(widget.control ? Strings.descTR : Strings.descEN,
                    style: GoogleFonts.comfortaa(
                        letterSpacing: 1,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(.7)),
                    textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 24,
              ),
              InkWell(
                hoverColor: Colors.transparent,
                onTap: () => _launchURL(Strings.cvLink),
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
                        widget.control ? Strings.cvGoster : Strings.viewResume,
                        style: GoogleFonts.comfortaa(
                            fontSize: 24, color: Colors.white),
                        textAlign: TextAlign.center,
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
