import 'package:flutter/material.dart';

import '../helpers/size_config.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.hintText});
  final String hintText;
  @override
  Widget build(BuildContext context) {
    final width = SizeConfig.sizeWidth(context);
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
      child: TextField(
        textAlign: TextAlign.start,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: width * 0.03)),
      ),
    );
  }
}
