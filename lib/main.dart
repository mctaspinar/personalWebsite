import 'package:flutter/material.dart';
import 'package:flutter_website/customs/responsive_screen.dart';
import 'package:flutter_website/utils/strings.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.name,
      theme: ThemeData(
          primaryColor: Colors.brown.shade600,
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)),
      debugShowCheckedModeBanner: false,
      home: ResponsiveScreen(),
    );
  }
}
