import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color colorBackgroundDark = const Color(0xff333333);
Color colorWhite = const Color(0xffFFFFFF);
Color colorGrey = const Color(0xffADADAD);
Color colorBlack = const Color(0xff000000);

Color colorInputFiled = const Color(0xffDCDCDC);

TextStyle textHeader = GoogleFonts.poppins(
    color: colorWhite, fontSize: 22, fontWeight: FontWeight.w700);

TextStyle textLabel = GoogleFonts.poppins(
    color: colorWhite, fontSize: 14, fontWeight: FontWeight.w400);

TextStyle textInput = GoogleFonts.lato(
    color: colorBlack, fontSize: 18, fontWeight: FontWeight.w700);

BoxDecoration buttonDecoration = BoxDecoration(
  color: colorBackgroundDark,
  borderRadius: BorderRadius.circular(50),
  boxShadow: const [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.65),
      offset: Offset(4, 4),
      blurRadius: 5,
      spreadRadius: 1,
    ),
    BoxShadow(
      color: Color.fromRGBO(255, 255, 255, 0.3),
      offset: Offset(-4, -4),
      blurRadius: 5,
      spreadRadius: 1,
    ),
  ],
);

ButtonStyle buttonStyle = TextButton.styleFrom(
  foregroundColor: colorGrey,
);

InputDecoration decorTextField = InputDecoration(
  filled: true,
  fillColor: colorInputFiled,
  border: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(15),
    ),
    borderSide: BorderSide(color: colorBlack),
  ),
  hintText: 'Enter a search term',
  alignLabelWithHint: false,
  hintStyle: TextStyle(color: colorGrey),
);

InputDecoration decorDropDown = InputDecoration(
  // contentPadding: const EdgeInsets.only(
  //   //top: 10,
  //   //bottom: 10,
  //   right: 10,
  // ),
  prefixIcon: Icon(
    Icons.print,
    color: colorBackgroundDark,
  ),
  filled: true,
  fillColor: colorInputFiled,
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15),
    ),
  ),
  hintText: 'Select Device',
  hintStyle: TextStyle(color: colorGrey),
);
