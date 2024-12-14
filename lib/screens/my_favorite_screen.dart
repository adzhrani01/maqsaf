
import 'package:flutter/material.dart';
import 'package:maqsaf_app/screens/details_order_screen.dart';

import '../constants/assets_path.dart';
import '../constants/colors_constants.dart';
import '../helpers/size_config.dart';
import '../widgets/components.dart';

class MyFavoriteScreen extends StatefulWidget {
  const MyFavoriteScreen({super.key});

  @override
  State<MyFavoriteScreen> createState() => _MyFavoriteScreenState();
}

class _MyFavoriteScreenState extends State<MyFavoriteScreen> {

  int typeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final height = SizeConfig.sizeHeight(context);
    final width = SizeConfig.sizeWidth(context);

    return  SafeArea(child: Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor:AppColor.primaryColor,
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
                        Text('الوجبات المفضلة', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: width * 0.05)),
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
              const SizedBox(height: 30),
              SizedBox(
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16,),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){

                        },
                        child: Container(
                          width: width,
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          margin: const EdgeInsets.only(bottom: 10,),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex:1,child: Image.asset(AssetsPath.food)),
                              const SizedBox(width: 10),
                              Expanded(flex:3,child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('food${index + 1}', textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: width * 0.04)),
                                          Text('info${index + 1}', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize: width * 0.04)),
                                        ],
                                      )),
                                      const SizedBox(width: 10),
                                      IconButton(onPressed: (){}, icon: const Icon(Icons.favorite, color: Colors.red,))
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(child: Text('10${index + 10} RSA', textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: width * 0.04, fontWeight: FontWeight.w600))),
                                      const SizedBox(width: 10),
                                      InkWell(
                                        onTap: (){
                                          navigationPush(context, const DetailsOrderScreen());
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                          margin: const EdgeInsets.symmetric(horizontal: 15),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF074E0A),
                                            borderRadius:BorderRadius.circular(10),
                                          ),
                                          child:  Text('Add', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: width * 0.05)),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    ));
  }
}



