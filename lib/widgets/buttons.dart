import 'package:flutter/material.dart';
import 'package:thermal_printer/theme/theme.dart';

Widget buttonPrint(String text, double width) {
  return Container(
    height: 50,
    width: width,
    decoration: buttonDecoration,
    child: TextButton(
      style: TextButton.styleFrom(
        foregroundColor: colorGrey,
      ),
      onPressed: () {},
      child: Text(
        'Print',
        style: textLabel,
      ),
    ),
  );
}

Widget buttonLoadImage(String text, double width) {
  return Container(
    height: 50,
    width: width,
    //color: colorWhite,
    decoration: buttonDecoration,
    child: TextButton(
      style: TextButton.styleFrom(
        foregroundColor: colorGrey,
      ),
      onPressed: () {},
      child: Text(
        text,
        style: textLabel,
      ),
    ),
  );
}

Widget buttonLoadPDF(String text, double width) {
  return Container(
    height: 50,
    width: width,
    //color: colorWhite,
    decoration: buttonDecoration,
    child: TextButton(
      style: TextButton.styleFrom(
        foregroundColor: colorGrey,
      ),
      onPressed: () {},
      child: Text(
        text,
        style: textLabel,
      ),
    ),
  );
}
