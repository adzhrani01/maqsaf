
import 'package:flutter/material.dart';

class AppColor{
  // 3D7EB9
  // 0DA9A6
  // 1E1E1E
 // static const primaryColor = const Color(0xff052659);
  static const primaryColor = Color(0xff15445A);
  static const secondaryColor = Color(0xff15445A);
  static const thirdColor = Color(0xff5483B3);
  static const blackColor = Color(0xff000000);
  static const darkGrey=Color(0xff1E1E1E);
  static const whiteColor = Color(0xFFFFFCFC);
  static const green = Color(0xFF07A869);

  static const color1 = Color(0xff3D7EB9);
  static const color2 = Color(0xff0DA9A6);
  static const color3 = Color(0xff1E1E1E);

  // gray color shade
  static const GreyShade1 = Color(0xFF8E8E93);
  static const GreyShade2 = Color(0xFFAEAEB2);
  static const GreyShade3 = Color(0xFFC7C7CC);
  static const GreyShade4 = Color(0xFFD1D1D6);
  static const GreyShade5 = Color(0xFFE5E5EA);
  static const GreyShade6 = Color(0xFFF2F2F7);


  static const Color greyColor = Color(0xff9e9e9e);
  static const Color navyColor = Color(0xff4b4b4b);

  static const shadowColor = Colors.black87;


  static const Color greyBg = Color(0xFFEFEFEF);

  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey350 = Color(0xFFD6D6D6);// only for raised button while pressed in light theme
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey850 = Color(0xFF303030); // only for background color in dark theme
  static const Color grey900 = Color(0xFF212121);

  static Map<int, Color> color =
  {
    50:const Color.fromRGBO(13,150,130, .1),
    100:const Color.fromRGBO(13,150,130, .2),
    200:const Color.fromRGBO(13,150,130, .3),
    300:const Color.fromRGBO(13,150,130, .4),
    400:const Color.fromRGBO(13,150,130, .5),
    500:const Color.fromRGBO(13,150,130, .6),
    600:const Color.fromRGBO(13,150,130, .7),
    700:const Color.fromRGBO(13,150,130, .8),
    800:const Color.fromRGBO(13,150,130, .9),
    900:const Color.fromRGBO(13,150,130, 1),

  };

  static MaterialColor colorCustom = MaterialColor(0xFF0D9682, color);
  static const Gradient myGradient = LinearGradient(
    colors: [Color(0xFF3D7EB9),Color(0xFF0DA9A6), Color(0xFF1E1E1E)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0,0.5, 1.0],
    tileMode: TileMode.clamp,);
  static final List<Color> gradientColors = [
    Color(0xFF3D7EB9),Color(0xFF0DA9A6), Color(0xFF1E1E1E)
  ];
}

