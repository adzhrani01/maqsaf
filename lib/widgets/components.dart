

import 'package:flutter/material.dart';

import '../constants/colors_constants.dart';


void navigationPush(context , widget){
  Navigator.push(context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}

void navigationPushAndRemoveUntil(context , widget){
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (Route<dynamic> route) => false,
  );
}


Decoration linearGradientDecoration(){
  return const BoxDecoration(
    gradient: LinearGradient(
      colors: [AppColor.color1, AppColor.color2],
      begin: Alignment.topCenter,
      end: Alignment.center,
    ),
  );
}