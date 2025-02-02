import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maqsaf_app/constants/colors_constants.dart';


Future<dynamic> globalBottomSheet({
  required BuildContext context,
  required String title,
  required Widget content,
  Widget? action,
  Widget? divider,
}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: AppColor.whiteColor,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            Navigator.pop(context, false);
            return false;
          },
          child: Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
                gradient:

                AppColor.myGradient,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 14.w),
              child: Container(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Container(

                      margin: EdgeInsets.only(bottom: 24.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () => Navigator.pop(context),
                                child: Icon(
                                  Icons.close,
                                  size: 24.r,
                                ),
                              ),
                              const Spacer(),
                              Center(
                                child: Container(
                                  width: 26.w,
                                  height: 6.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              action ?? SizedBox(width: 24.r),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (divider != null) divider,
                        ],
                      ),
                    ),
                    Flexible(child: content),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
