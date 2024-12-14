
import 'package:flutter/material.dart';
import 'package:maqsaf_app/screens/payment_screen.dart';

import '../constants/assets_path.dart';
import '../constants/colors_constants.dart';
import '../helpers/size_config.dart';
import '../widgets/components.dart';
import '../widgets/custom_button.dart';

class DetailsOrderScreen extends StatefulWidget {
  const DetailsOrderScreen({super.key});

  @override
  State<DetailsOrderScreen> createState() => _DetailsOrderScreenState();
}

class _DetailsOrderScreenState extends State<DetailsOrderScreen> {

  int typeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final height = SizeConfig.sizeHeight(context);
    final width = SizeConfig.sizeWidth(context);

    return  SafeArea(child: Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          height: height,
          decoration: linearGradientDecoration(),
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                  borderRadius:BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
                  gradient: LinearGradient(
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
                        Text( 'طلب مسبق', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: width * 0.05)),
                      ],
                    )),
                    Expanded(flex:1,child:  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.shopping_cart_outlined,color: Colors.white,)),
                      ],
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Image.asset(AssetsPath.food,height: height * 0.30,),
              const SizedBox(height: 20),
       Expanded(child:  Container(
         height: height * 0.70,
         padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
         decoration: const BoxDecoration(
           color: Colors.white,
           borderRadius:BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisSize: MainAxisSize.max,
           children: [
             Text( 'ساندويتش تونه', textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: width * 0.05, fontWeight: FontWeight.w600)),
             const SizedBox(height: 20),
             Row(
               children: [
                 const Icon(Icons.star, color: Colors.amber,),
                 const SizedBox(width: 10),
                 Text( 'مفضله لدى طلاب الصف الرابع!', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize: width * 0.04)),
               ],
             ),
             const SizedBox(height: 20),
             Text( 'مناسبة لوجبة الغداء لو كان الطفل يظل وقت طويل خارج المنزل عبارة عن قطع الدجاج المقرمشة مع البروكلي المسلوق وملعقة مايونيز وقطع البطيخ أو أي فاكهة وقطعة كعكة بالشكولاتة وقطع البطاطس مع الجبن السائح أو قطع الدجاج الصغيرة مع الجبن السائح..', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize: width * 0.04)),
             SizedBox(height: height * 0.05),
             Row(
               children: [
                 Expanded(flex:2,child:  CustomButton(
                   label: 'اطلب الوجبه لليوم',
                   onTap: () {
                     navigationPush(context, const PaymentScreen());
                   },
                   txtSize: width * 0.04,
                 ),),
                 const SizedBox(width: 20),
                 Expanded(flex:2,child:  CustomButton(
                   label: '19 س.ر',
                   onTap: () {

                   },
                   primaryColor: AppColor.green,
                   txtSize: width * 0.04,
                 ),),
               ],
             )
           ],
         ),
       ),)

            ],
          ),
        ),
      ),
    ));
  }
}



