import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/color_manager.dart';
import 'load_base.dart';

class LoadCircleList extends StatelessWidget {
  const LoadCircleList({super.key, this.itemCount=3});
  final int? itemCount;
  @override
  Widget build(BuildContext context) {
    return
     Row(
      children:

      [
        for(int i=0;i<(itemCount??0);i++)
        content(context),

      ],
    );
  }

  content(BuildContext context) {
    return LoadBase(

      child:


        Container(

        padding:  EdgeInsets.all(12.w),
            width: 50.w,
            height: 50.h,
    margin:  EdgeInsets.symmetric(
    vertical: 8.w, horizontal:8.w),
    decoration: BoxDecoration(
    color: ColorManager.whiteColor,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
    BoxShadow(
    color: ColorManager.blackColor.withOpacity(.1),
    blurRadius: 8.0.w,
    ),
    ])
    ));
  }
}
