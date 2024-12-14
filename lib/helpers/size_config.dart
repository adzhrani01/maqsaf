
import 'package:flutter/material.dart';

class SizeConfig{
  static double sizeWidth(BuildContext context){
    return MediaQuery.of(context).size.width ;
  }

  static double sizeHeight(BuildContext context) {
    return MediaQuery.of(context).size.height  ;
  }
  static double sizeHeightWithoutKToolbar(BuildContext context) {
    return MediaQuery.of(context).size.height - getSizePaddingTopScreen(context) ;
  }

  static double getSizePaddingTopScreen(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double getSizeAppBarHeight(AppBar appBar){
    return appBar.preferredSize.height;
  }
}