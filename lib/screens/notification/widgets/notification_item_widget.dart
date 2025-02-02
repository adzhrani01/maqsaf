import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/string_manager.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../core/helpers/date_formate.dart';
import '../../../core/helpers/spacing.dart';
import '../data/models/notification_model.dart';

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({
    super.key, required this.index,  this.notification,
  });
  final int index;
  final NotificationModel? notification;
  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 14.h
          ),
          decoration: BoxDecoration(
              color: ColorManager.whiteColor,
              borderRadius: BorderRadius.circular(14.r),
              boxShadow: [
                BoxShadow(
                    color: ColorManager.blackColor.withOpacity(.04),
                    offset: Offset(0, 4.sp),
                    blurRadius: 20.sp)
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // notification?.state!=1 ?
              // index.isEven?
              CircleAvatar(
                radius: 4.sp,
                backgroundColor: ColorManager.primaryColor,
              ),
                  // :SizedBox.shrink(),
              horizontalSpace(10.w),
              Expanded(
                child: ListTile(
                  isThreeLine: true,
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    notification?.body??
                    // notification?.data?.message??
                    StringManager.notificationDoneSend,
                    style: StyleManager.font14Medium(),
                  ),
                  trailing: SizedBox.shrink(),
                  //     :Text(DateFormatHelper.formatTime(notification?.?DateTime(2024,7,27,12,30), 'ar_SA'),
                  //   maxLines: 2,
                  //   style: StyleManager.font10Light(
                  //   color: ColorManager.hintTextColor
                  // ),),
                  subtitle:Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Text(
                      notification?.topic??"",
                      // notification?.notification?.data?.message??
                      // 'تم إرسال عرضك إلى الطلب رقم 133421# بنجاح.',
                      maxLines: 2,
                      style: StyleManager.font14Regular(
                        color: ColorManager.hintTextColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
