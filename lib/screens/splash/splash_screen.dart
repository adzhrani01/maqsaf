import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/color_manager.dart';
import '../../constants/assets_path.dart';
import '../../constants/colors_constants.dart';
import 'cubits/splash_cubit/splash_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  ///animation
  late AnimationController _controller;
  late Animation<double> animation;
  _initAnimation(){
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
    _controller.forward();
  }
  ///end animation
  @override
  void initState() {
    _initAnimation();
    context.read<SplashCubit>().initSplash(context);
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor:AppColor.primaryColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: ScaleTransition(
              scale: animation,
              child: Image.asset(
                AssetsPath.logo,
                width: ScreenUtil.defaultSize.width / 2,
                height: ScreenUtil.defaultSize.width  / 2,
              ),
            ),
          ),
          Positioned(
            top: ScreenUtil.defaultSize.height / 1.3,
            child: Bounce(
              infinite: true,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                width: 16.sp,
                height: 16.sp,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: ColorManager.primaryColor
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
