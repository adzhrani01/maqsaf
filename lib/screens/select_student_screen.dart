import 'package:flutter/material.dart';
import 'package:maqsaf_app/screens/home_screen.dart';

import '../constants/assets_path.dart';
import '../constants/colors_constants.dart';
import '../helpers/size_config.dart';
import '../widgets/components.dart';

class SelectStudentScreen extends StatelessWidget {
  const SelectStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = SizeConfig.sizeHeight(context);
    final width = SizeConfig.sizeWidth(context);
    return SafeArea(
        child: Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Container(
          height: height,
          decoration: linearGradientDecoration(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset(AssetsPath.logo),
                ),
                SizedBox(height: height * 0.15),
                Align(
                  alignment: Alignment.center,
                  child: Text('الابناء',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: height * 0.05),
                GestureDetector(
                  onTap: () {
                    navigationPush(context, const HomeScreen());
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: width * 0.05,
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: AppColor.secondaryColor,
                        borderRadius: BorderRadius.circular(35)),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('محمد خالد الحربي',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.05)),
                                  const SizedBox(height: 10),
                                  Text('عبدالرحمن فقيه',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.03)),
                                ],
                              ),
                            )),
                        Expanded(
                            flex: 1, child: Image.asset(AssetsPath.student)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
