import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';

import 'large_screen.dart';
import 'small_screen.dart';

class ResponsiveScreen extends StatefulWidget {
  @override
  _ResponsiveScreenState createState() => _ResponsiveScreenState();
}

class _ResponsiveScreenState extends State<ResponsiveScreen> {
  bool langControl;
  @override
  void initState() {
    langControl = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var size = 850;
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              minHeight: constraints.maxHeight,
              maxHeight: double.infinity,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        child: Stack(
                          children: [
                            ClipPath(
                              child: Container(
                                color: Colors.brown.shade200,
                                width: screenSize.width,
                                height: 100,
                              ),
                              clipper: WaveClipperOne(),
                            ),
                            ClipPath(
                              child: Container(
                                color: Colors.brown.shade600,
                                width: screenSize.width,
                                height: 80,
                              ),
                              clipper: WaveClipperTwo(),
                            ),
                            Positioned(
                                child: Container(
                                    child: Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            langControl = true;
                                          });
                                        },
                                        hoverColor: Colors.transparent,
                                        child: Text("TR",
                                            style: GoogleFonts.comfortaa(
                                                fontSize: 18,
                                                color: Colors.brown[200]))),
                                    Text("  |  ",
                                        style: GoogleFonts.comfortaa(
                                            fontSize: 14,
                                            color: Colors.brown[200])),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            langControl = false;
                                          });
                                        },
                                        hoverColor: Colors.transparent,
                                        child: Text("EN",
                                            style: GoogleFonts.comfortaa(
                                                fontSize: 18,
                                                color: Colors.brown[200]))),
                                  ],
                                )),
                                top: 10,
                                right: 10)
                          ],
                        ),
                      ),
                    ),
                  ),
                  screenSize.width < size
                      ? SmallScreen(
                          control: langControl,
                        )
                      : LargeScreen(
                          control: langControl,
                        ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 40,
                          width: screenSize.width,
                          color: Colors.brown.shade600,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: FittedBox(
                                    child: Text(
                                        "Copyrights 2021 © Mete Çağrı TAŞPINAR",
                                        style: GoogleFonts.comfortaa(
                                            letterSpacing: 5,
                                            color: Colors.brown[200],
                                            fontSize: 10),
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
