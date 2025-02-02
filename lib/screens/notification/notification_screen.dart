
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maqsaf_app/constants/colors_constants.dart';
import 'package:maqsaf_app/screens/notification/widgets/notification_item_widget.dart';
import '../../../core/utils/color_manager.dart';
import '../profile/cubits/user_cubit/user_cubit.dart';
import 'cubits/notifications_cubit/notifications_cubit.dart';
import 'data/models/notification_model.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    context.read<NotificationsCubit>().init(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading:   Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color:AppColor.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
        title: Center(child: Text("الاشعارات")),
      ),
      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0DA9A6), Color(0xFF07A869)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child:

        BlocBuilder<NotificationsCubit,NotificationsState>(
          buildWhen: (previous, current)=>context.read<NotificationsCubit>().buildNotificationsWhen(previous, current),
          builder: (context, state)=>

              context.read<NotificationsCubit>().buildNotifications(context, state,

          ListView.builder(
          itemCount: context.read<NotificationsCubit>().allNotifications.length,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemBuilder: (context, index) =>NotificationItemWidget(index:0,notification: context.read<NotificationsCubit>().allNotifications[index],))
              ),
        ),
      ),
      // body: ScaffoldGradientWidget(
      //   child: ListView.separated(
      //     padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      //     itemCount: 20,
      //     itemBuilder: (context, index) => NotificationItemWidget(index:index),
      //     separatorBuilder: (_, __) => verticalSpace(14.h),
      //   ),
      // ),
    );
  }
}
