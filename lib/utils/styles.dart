import 'package:division/division.dart';
import 'package:flutter/widgets.dart';
import 'package:pahiream_frontend/utils/constants.dart';

// example for containers/ same with "div"
final styleSideMenu = ParentStyle()
  ..background.color(kDark)
  ..alignment.center()
  ..width(319)
  ..border(right: 1, color: kGray);

// example for Texts
final styleSideMenuTitle = TxtStyle()
  ..fontSize(18 / 1.2)
  ..padding(bottom: 16)
  ..bold()
  ..letterSpacing(1.8)
  ..textColor(kPrimaryGreen);






// example for containers/ same with "div"
final styleCreatePostDialog = ParentStyle()
  ..background.color(kWhite)
  ..padding(all: 15)
  ..maxWidth(800)
//   ..height(600)
//   ..border(right: 1, color: kGray)
  ..elevation(5)
;

// example for containers/ same with "div"
final styleFloatingActionButton = ParentStyle()
//   ..background.color(kPrimaryGreen)
//   ..width(400)
//   ..width(140)
//   ..border(right: 1, color: kGray)
;

// example for containers/ same with "div"
final styleChatBtn = ParentStyle()
..background.color(kPrimaryGreen)
..elevation(3)
..padding(all: 5)
..maxHeight(40)
..alignmentContent.center()
..borderRadius(all: 10)
  ;

// example for Texts
final styleFABFont = TxtStyle()
  ..fontSize(24 / 1.2)
  ..bold()
  ..letterSpacing(1.4)
  ..textColor(kWhite);


// example for containers/ same with "div"
final styleCreatePostBtn = ParentStyle()
..background.color(kPrimaryGreen)
..elevation(3)
..padding(all: 5)
..maxHeight(40)
..alignmentContent.center()
..borderRadius(all: 25)
  ;

final styleServiceCard = ParentStyle()
  ..background.color(kWhite)
  ..width(500)
  ..height(150)
  ..borderRadius(all: 10)
  ..margin(all:9)
  ..padding(right: 16, left: 16, top: 15, bottom: 17.3);

final styleServiceTitle = TxtStyle()
  ..fontSize(22)
  ..letterSpacing(0)
  ..bold()
  ..textOverflow(TextOverflow.ellipsis)
  ..textColor(kFontColorBlack);
