import 'package:flutter/material.dart';
import 'package:maqsaf_app/constants/assets_path.dart';
import 'package:maqsaf_app/screens/home_screen.dart';

import '../../constants/colors_constants.dart';
import '../../helpers/size_config.dart';
import '../../widgets/components.dart';

class TalkingScreen extends StatefulWidget {
  const TalkingScreen({super.key});

  @override
  State<TalkingScreen> createState() => _TalkingScreenState();
}

class _TalkingScreenState extends State<TalkingScreen> {
  int typeIndex = 0;
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
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            children: [
              Image.asset(AssetsPath.animation_hape2),
              SizedBox(height: height * 0.10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                margin: const EdgeInsets.only(
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text('Tap to Cancel',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Colors.white, fontSize: width * 0.05)),
              ),
              SizedBox(height: height * 0.05),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: AppColor.color2,
          height: height * 0.10,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(AssetsPath.stop),
                  )),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                ),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(AssetsPath.end),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
