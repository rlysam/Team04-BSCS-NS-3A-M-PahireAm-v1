// ignore_for_file: must_be_immutable

// Custom reusable widgets
// https://www.youtube.com/watch?v=-eNm8pNYmjo

//! ganito lang pala mag modify ng widget taena pinapahirapan ko sarili ko dati

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
        decoration:
            isUnderlined ? TextDecoration.underline : TextDecoration.none);
  }
}

class CommonStyleInput {
  static InputDecoration textFieldStyle({
    String labelTextStr = "",
    String hintTextStr = "",
    bool isCorrect = true,
    bool hasIcon = false,
  }) {
    OutlineInputBorder outlineRed() {
      return OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: kFontColorRedWarning),
          borderRadius: BorderRadius.circular(10));
    }

    OutlineInputBorder outline() {
      return OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(10));
    }

    return InputDecoration(
        //! size ng textbox? HEIGHT
        suffixIcon: hasIcon
            ? MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                    child:
                        (Icon(Icons.visibility_outlined, color: kIconColor1))),
              )
            : const SizedBox(),
        contentPadding: const EdgeInsets.fromLTRB(15, 5, 11, 5),
        labelText: labelTextStr,
        hintText: hintTextStr,
        filled: true,
        fillColor: kWhite,
        enabledBorder: (isCorrect ? outline() : outlineRed()),
        focusedBorder: (isCorrect ? outline() : outlineRed()),
        disabledBorder: (isCorrect ? outline() : outlineRed()),
        border: (isCorrect ? outline() : outlineRed()));
  }
}

class CommonStyleButton {
  static ButtonStyle btnStyle(
      {String labelTextStr = "", String hintTextStr = ""}) {
    return ButtonStyle(
        elevation: MaterialStateProperty.all(6),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          // side: BorderSide(color: kPrimaryGreen),
        )),
        backgroundColor: MaterialStateProperty.all(kPrimaryGreen));
  }
}
