
import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:maqsaf_app/screens/charge_balance_screen.dart';
import 'package:maqsaf_app/screens/profile_screen.dart';
import 'package:maqsaf_app/widgets/components.dart';

import '../constants/assets_path.dart';
import '../constants/colors_constants.dart';
import '../helpers/size_config.dart';
import 'chatgpt_screen.dart';
import 'home_page.dart';
import 'my_favorite_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int indexPage = 0;
  @override
  Widget build(BuildContext context) {
    final height = SizeConfig.sizeHeight(context);
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: height,
            decoration: linearGradientDecoration(),
            child: CurvedNavBar(
              actionButton: CurvedActionBar(
                  onTab: (value) {
                    indexPage = 2;
                    setState(() {

                    });
                    /// perform action here
                    // print( value);
                    //   navigationPush(context,ChatgptScreen());
                  },
                  activeIcon: Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration:
                    const BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
                    child: Image.asset(AssetsPath.image, height: 24, width: 24,),
                  ),
                  inActiveIcon: Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration:
                    const BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
                    child: Image.asset(AssetsPath.image, height: 24, width: 24,),
                  ),
                  text: indexPage == 2 ? '.' : ''),
              activeColor: Colors.white,
              navBarBackgroundColor: AppColor.primaryColor,
              inActiveColor: Colors.white,
              actionBarView: const ChatgptScreen(),
              appBarItems: [
                FABBottomAppBarItem(
                  activeIcon: InkWell(
                    onTap: (){
                      indexPage = 0;
                      setState(() {

                      });},
                    child: const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  ),
                  inActiveIcon: InkWell(
                    onTap: (){
                      indexPage = 0;
                      setState(() {

                      });},
                    child: const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  ),
                  text: indexPage == 0 ? '.' : '',
                ),
                FABBottomAppBarItem(

                    activeIcon: InkWell(
                      onTap: (){
                        indexPage = 1;
                        setState(() {

                        });},
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                    ),
                    inActiveIcon: InkWell(
                      onTap: (){
                        indexPage = 1;
                        setState(() {

                        });},
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                    ),
                    text: indexPage == 1 ? '.' : ''),
                FABBottomAppBarItem(
                    activeIcon: InkWell(
                      onTap: (){
                        indexPage = 3;
                        setState(() {

                        });},
                      child: Image.asset(AssetsPath.wallet,color: Colors.white, height: 24, width: 24,),
                    ),
                    inActiveIcon: InkWell(
                      onTap: (){
                        indexPage = 3;
                        setState(() {

                        });},
                      child: Image.asset(AssetsPath.wallet,color: Colors.white, height: 24, width: 24,),
                    ),
                    text: indexPage == 3 ? '.' : ''),
                FABBottomAppBarItem(
                    activeIcon: InkWell(
                      onTap: (){
                        indexPage = 4;
                        setState(() {

                        });},
                      child: Image.asset(AssetsPath.group,color: Colors.white, height: 24, width: 24,),
                    ),
                    inActiveIcon: InkWell(
                      onTap: (){
                        indexPage = 4;
                        setState(() {

                        });},
                      child: Image.asset(AssetsPath.group,color: Colors.white, height: 24, width: 24,),
                    ),
                    text:indexPage == 4 ? '.' : ''),
              ],
              bodyItems: const [
                HomePage(),
                MyFavoriteScreen(),
                ChargeBalanceScreen(),
                ProfileScreen(),
                // Container(
                //   height: MediaQuery.of(context).size.height,
                //   color: Colors.white,
                // ),
                //  MyFilesPage(),
              ],
              // actionBarView: Container(
              //   height: MediaQuery.of(context).size.height,
              //   color: Colors.black45,
              // ),
            ),
          ),
        ),
      ),

    );
  }
}



