import 'package:flutter/material.dart';


void navigationPush(context, widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}

void navigationPushAndRemoveUntil(context, widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false,
  );
}

Decoration linearGradientDecoration() {
  return const BoxDecoration(
    gradient: LinearGradient(
      colors: [Color(0xFF0DA9A6), Color(0xFF07A869)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
}
