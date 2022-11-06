import 'package:flutter/material.dart';
import 'package:thermal_printer/theme/theme.dart';

TextEditingController textC = TextEditingController();

Widget inputText = TextField(
  controller: textC,
  maxLines: 10,
  minLines: 10,
  textAlign: TextAlign.center,
  style: textInput,
  decoration: InputDecoration(
    filled: true,
    fillColor: colorInputFiled,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    hintText: 'Enter a search term',
    alignLabelWithHint: false,
    hintStyle: TextStyle(color: colorGrey),
  ),
);
