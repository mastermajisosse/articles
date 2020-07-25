import 'package:flutter/material.dart';

class Mystyle {
  static const Color primarycolo = Color(0xFF000843); // #000843

  static const Color blight = Colors.lightBlue; // #3a6aff

  static const Color sfarcolo = Color(0xFFffc100); //#ffc100
  static const Color redcolo = Color(0xFFf73222); //#f73222
  static const Color orangecolo = Color(0xFFff770f); //#ff770f
  static const Color greencolo = Color(0xFF0fff64); //#0fff64

  static TextStyle titleTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontSize: 28,
  );

  static TextStyle monthtopicTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w800,
    fontSize: 24,
  );

  static TextStyle newtopicTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontSize: 24,
  );

  static TextStyle regulartitleTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );

  static TextStyle regularTextStyle = TextStyle(
    color: Colors.grey[800],
    fontWeight: FontWeight.w300,
    fontSize: 16,
  );

  // -----------

  static Decoration roundPic(url) => BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(50),
      );

  static inputDecoration({String hint, Widget icon = null}) {
    return InputDecoration(
      labelText: '$hint',
      // labelStyle: regularTextStyle,
      suffixIcon: icon ?? icon,
      contentPadding: EdgeInsets.only(right: 24, top: 20, bottom: 20),
      isDense: true,
      alignLabelWithHint: true,
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primarycolo.withOpacity(.2), width: 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primarycolo.withOpacity(.2), width: 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }

  static Decoration butdec = BoxDecoration(
    color: primarycolo,
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );
}
