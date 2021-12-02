// ignore_for_file: must_be_immutable

// Custom reusable widgets
// https://www.youtube.com/watch?v=-eNm8pNYmjo

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pahiream_frontend/utils/constants.dart';

class CommonStyleText {
  static TextStyle txtStyle({
    double? size = 14,
    FontWeight? weigth = FontWeight.normal,
    Color? color = const Color(0xff544B4B),
    bool isUnderlined = false,
  }) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: weigth,
      decoration: isUnderlined? TextDecoration.underline : TextDecoration.none
    );
  }
}

class CommonStyleInput {
  static InputDecoration textFieldStyle(
      {String labelTextStr = "", String hintTextStr = ""}) {
    OutlineInputBorder outline() {
      return OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(10));
    }

    return InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(15, 11, 11, 11),
        labelText: labelTextStr,
        hintText: hintTextStr,
        filled: true,
        fillColor: kWhite,
        focusedBorder: outline(),
        disabledBorder: outline(),
        border: outline());
  }
}

class CommonStyleButton {
  static ButtonStyle btnStyle(
      {String labelTextStr = "", String hintTextStr = ""}) {
    return ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          // side: BorderSide(color: kPrimaryGreen),
        )),
        backgroundColor: MaterialStateProperty.all(kPrimaryGreen));
  }
}
