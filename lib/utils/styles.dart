import 'package:division/division.dart';
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