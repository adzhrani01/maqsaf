
import 'package:flutter/material.dart';
import 'package:maqsaf_app/screens/home_screen.dart';

import '../constants/colors_constants.dart';
import '../helpers/size_config.dart';
import '../widgets/components.dart';
import '../widgets/custom_button.dart';

class SuccessPaymentScreen extends StatefulWidget {
  const SuccessPaymentScreen({super.key});

  @override
  State<SuccessPaymentScreen> createState() => _SuccessPaymentScreenState();
}

class _SuccessPaymentScreenState extends State<SuccessPaymentScreen> {

  @override
  Widget build(BuildContext context) {
    final height = SizeConfig.sizeHeight(context);
    final width = SizeConfig.sizeWidth(context);

    return  SafeArea(child: Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
              gradient:

              AppColor.myGradient),
          child: SizedBox(
            height: height,
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),

                  decoration: const BoxDecoration(

                    borderRadius:BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
                    gradient:

                    LinearGradient(
                        colors: [Color(0xff2D91C0),Color(0xff15445A)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0,0.9]
                    ),
                  ),
                  child:Row(
                    children: [
                      Expanded(flex:2,child:  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
                          const SizedBox(width: 8),
                          Text( 'الدفع', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: width * 0.05)),
                        ],
                      )),

                    ],
                  ),
                ),
                SizedBox(height: height * 0.25),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin: const EdgeInsets.symmetric(horizontal: 16),

                      decoration: BoxDecoration(

                    color: Colors.transparent,
                    // color: Colors.white,
                    borderRadius:BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.check_circle, color: AppColor.secondaryColor, size: 64,),
                      const SizedBox(height: 10),
                      Text( 'تم الطلب بنجاح', textAlign: TextAlign.start, style: TextStyle(color: Colors.white, fontSize: width * 0.05, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),

                        const SizedBox(height: 30),
                      CustomButton(
                        primaryColor :AppColor.secondaryColor,
                        textColor : AppColor.whiteColor,
                        label: 'عودة للصفحة الرئيسية',
                        onTap: () {
                          navigationPush(context, const HomeScreen());
                        },
                        txtSize: width * 0.04,
                      ),
                    ],
                  ),),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}



