
import 'package:flutter/material.dart';
import 'package:maqsaf_app/constants/assets_path.dart';
import 'package:maqsaf_app/screens/chat_gpt/talking_screen.dart';

import '../../constants/colors_constants.dart';
import '../../helpers/size_config.dart';
import '../../widgets/components.dart';
import '../../widgets/custom_button.dart';


class ChooseVoicScreen extends StatefulWidget {
  const ChooseVoicScreen({super.key});

  @override
  State<ChooseVoicScreen> createState() => _ChooseVoicScreenState();
}

class _ChooseVoicScreenState extends State<ChooseVoicScreen> {

  int typeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final height = SizeConfig.sizeHeight(context);
    final width = SizeConfig.sizeWidth(context);

    return  SafeArea(child: Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor:AppColor.primaryColor,
        body: Container(
          height: height,
          decoration: linearGradientDecoration(),
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
            children: [
              ListTile(
                leading: const Icon(Icons.volume_up_rounded, color: Colors.white,),
                title:Text('Choose a voice', textAlign: TextAlign.start, style: TextStyle(color: Colors.white, fontSize: width * 0.04, fontWeight: FontWeight.bold)),
                subtitle:Text('You can change this later.', textAlign: TextAlign.start, style: TextStyle(fontSize: width * 0.04)),
              ),
              SizedBox(height: height * 0.05),
              Image.asset(AssetsPath.animation_shape),
              SizedBox(height: height * 0.10),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                  margin: const EdgeInsets.only(bottom: 10,),
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor.withOpacity(0.2),
                    borderRadius:BorderRadius.circular(15),
                  ),
                  child: Text('Breeze', textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: width * 0.05)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                margin: const EdgeInsets.only(bottom: 10,),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor.withOpacity(0.2),
                  borderRadius:BorderRadius.circular(15),
                ),
                child: Text('Cove', textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: width * 0.05)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                margin: const EdgeInsets.only(bottom: 10,),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor.withOpacity(0.2),
                  borderRadius:BorderRadius.circular(15),
                ),
                child: Text('Sky', textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: width * 0.05)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                margin: const EdgeInsets.only(bottom: 10,),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor.withOpacity(0.2),
                  borderRadius:BorderRadius.circular(15),
                ),
                child: Text('Juniper', textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: width * 0.05)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                margin: const EdgeInsets.only(bottom: 10,),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor.withOpacity(0.2),
                  borderRadius:BorderRadius.circular(15),
                ),
                child: Text('Ember', textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: width * 0.05)),
              ),
              SizedBox(height: height * 0.05),

            ],
          ),
        ),

        bottomNavigationBar: BottomAppBar(
          color: AppColor.color2,
          height: height * 0.10,
          child: CustomButton(
            label: 'Confirm',
            onTap: () {
              navigationPush(context, const TalkingScreen());
            },
            primaryColor: Colors.white,
            textColor: Colors.black,
            txtSize: width * 0.04,
          ),
        ),
      ),
    ));
  }
}



