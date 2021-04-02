import 'package:flutter/material.dart';
import 'package:flutter_website/utils/strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomBanner extends StatefulWidget {
  final bool control;
  BottomBanner({Key key, @required this.control}) : super(key: key);

  @override
  _BottomBannerState createState() => _BottomBannerState();
}

class _BottomBannerState extends State<BottomBanner> {
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
    return Container(
      width: screenSize.width,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            hoverColor: Colors.transparent,
            onTap: () => _launchURL(Strings.cvLink),
            onHover: (value) {
              setState(() {
                !value
                    ? colorOfInk = Colors.brown[400]
                    : colorOfInk = Colors.brown[700];
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: colorOfInk,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: FittedBox(
                  child: Text(
                    widget.control ? Strings.cvGoster : Strings.viewResume,
                    style: GoogleFonts.comfortaa(
                        fontSize: 18, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 48,
          ),
          FittedBox(
            child: Text(
              widget.control ? Strings.sosyal : Strings.social,
              style: GoogleFonts.comfortaa(
                  color: Colors.blueGrey,
                  letterSpacing: 2,
                  fontSize: 14,
                  fontWeight: FontWeight.w200),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          FittedBox(
            child: Row(
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
                SizedBox(
                  width: 12,
                ),
                InkWell(
                  hoverColor: Colors.transparent,
                  onTap: () => _launchURL(Strings.ghub),
                  child: Image.asset(
                    "asset/images/ghub.png",
                    height: 44,
                    width: 44,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
