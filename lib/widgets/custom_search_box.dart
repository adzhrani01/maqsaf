import 'package:flutter/material.dart';

import '../constants/colors_constants.dart';
import '../helpers/size_config.dart';


class CustomSearchBox extends StatelessWidget {
  const CustomSearchBox({ super.key });

  @override
  Widget build(BuildContext context) {
    final width = SizeConfig.sizeWidth(context);
    return Container(
        height: 40,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: TextField(
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            border: InputBorder.none,
            hintText:"Message",
            hintStyle:  TextStyle(color: Colors.grey, fontSize: width * 0.04)),
        ),
      );
  }
}