import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:google_fonts/google_fonts.dart';

import '../customs/social_link.dart';
import '../utils/strings.dart';

class BottomBanner extends StatefulWidget {
  final bool control;
  BottomBanner({Key key, @required this.control}) : super(key: key);

  @override
  _BottomBannerState createState() => _BottomBannerState();
}

class _BottomBannerState extends State<BottomBanner> {
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
          Link(
            uri: Uri.parse(Strings.cvLink),
            target: LinkTarget.blank,
            builder: (context, goToLink) {
              return InkWell(
                hoverColor: Colors.transparent,
                onTap: goToLink,
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
              );
            },
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
            child: SocialLink(),
          ),
        ],
      ),
    );
  }
}
