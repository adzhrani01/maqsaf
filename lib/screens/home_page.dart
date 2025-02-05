import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maqsaf_app/constants/assets_path.dart';
import 'package:maqsaf_app/core/widgets/image/image_user.dart';
import 'package:maqsaf_app/screens/notification/notification_screen.dart';
import 'package:maqsaf_app/screens/payment_carts/card_page.dart';
import 'package:maqsaf_app/screens/charge_balance_screen.dart';
import 'package:maqsaf_app/screens/daily_limit_screeen.dart';
import 'package:maqsaf_app/screens/deleted_foods/food_removed_screen.dart';
import 'package:maqsaf_app/screens/items/online_order_screen.dart';
import 'package:maqsaf_app/screens/profile/cubits/user_cubit/user_cubit.dart';
import 'package:maqsaf_app/screens/orders/purchase_operation_screen.dart';
import 'package:maqsaf_app/screens/select_student_screen.dart';
import 'package:maqsaf_app/screens/shopping_screen.dart';
import 'package:maqsaf_app/widgets/actionCard.dart';
import 'package:maqsaf_app/widgets/components.dart';
import 'package:maqsaf_app/widgets/orderr.dart';

import '../constants/colors_constants.dart';
import 'orders/cubits/carts_cubit/orders_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<OrdersCubit>().init(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient:
              AppColor.myGradient,
              // LinearGradient(
              //   colors: [Color(0xFF0DA9A6), Color(0xFF07A869)],
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              // ),
            ),
            child:   BlocConsumer<UserCubit, UserState>(
                listener: (context, state) {
                },
                buildWhen: (prev,next)=>next==UserState.save(),
                builder: (context, state) {
                  final user= context.read<UserCubit>().user;
                  return CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        expandedHeight: 370,
                        floating: false,
                        pinned: true,
                        elevation: 0,
                        leading: Container(),
                        backgroundColor: Colors.transparent,
                        flexibleSpace: Container(
                          decoration: const BoxDecoration(
                            gradient:

                            LinearGradient(
                              colors: [Color(0xFF2D91C0), Color(0xFF15445A)],
                              begin: Alignment.bottomLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                          child: FlexibleSpaceBar(
                            background: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // Header Section
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.menu,
                                                color: Colors.white),
                                            onPressed: () {
                                              navigationPush(
                                                  context, SelectStudentScreen());
                                            },
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.notifications,
                                                color: Colors.white),
                                            onPressed: () {
                                              navigationPush(
                                                  context, NotificationScreen());
                                            },
                                          ),

                                        ],
                                      ),

                                      _buildIconButton(Icons.shopping_cart, () {
                                        navigationPush(context, const CartScreen());
                                      }),
                                      // Container()
                                    ],
                                  ),
                                ),

                                // Profile Section with Stats
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                        ),
                                        child: CircleAvatar(
                                          radius: width * 0.12,
                                          child:  ImageUser(url: user?.image,fit: BoxFit.cover,width:  width * 0.4,height: width * 0.4,),
                                          // backgroundImage:
                                          //   AssetImage(
                                          //       AssetsPath.rectangle_student),
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        user?.completeName??
                                            'محمد خالد الحربي',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.05,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 20),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.15),
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(
                                              color: Colors.white.withOpacity(0.2)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            _buildHeaderStat('الحد اليومي', '${ user?.dailyLimit??'-'} س.ر'),
                                            // _buildHeaderStat('الحد اليومي', '10 س.ر'),
                                            Container(
                                              height: 40,
                                              width: 1,
                                              color: Colors.white.withOpacity(0.3),
                                            ),
                                            _buildHeaderStat(
                                                'الرصيد الحالي', '${ user?.balance??'-'} س.ر'),
                                            // 'الرصيد الحالي', '55 س.ر'),
                                            Container(
                                              height: 40,
                                              width: 1,
                                              color: Colors.white.withOpacity(0.3),
                                            ),
                                            _buildHeaderStat('رقم الطالب', '${ user?.id??'-'}'),
                                            // _buildHeaderStat('رقم الطالب', '0001'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'الخدمات السريعة',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.whiteColor,
                                        shadows:[
                                          BoxShadow(
                                            color: AppColor.secondaryColor,
                                            blurRadius: 10,
                                            offset: const Offset(0, 5),
                                          ),
                                        ]
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  _buildGridMenu(context),
                                ],
                              ),
                            ),
                            BlocBuilder<OrdersCubit,OrdersState>(
                                buildWhen: (previous, current)=>context.read<OrdersCubit>().buildItemsWhen(previous, current),
                                builder: (context, state)=>
                                    context.read<OrdersCubit>().buildItems(context, state,
                                        CafeteriaOrdersWidget(items:context.read<OrdersCubit>().items))
                            )
                            ,
                          ],
                        ),
                      ),
                    ],
                  );
                }
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderStat(String label, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildStatColumn(String label, String value, IconData icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: const Color(0xFF2D91C0), size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.grey[300],
    );
  }

  Widget _buildActionCard(String icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 32,
              width: 32,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildIconButton(IconData icon, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Icon(icon, color: Colors.white, size: 22),
    ),
  );
}

Widget _buildGridMenu(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      children: [
        ActionCard(
          icon: AssetsPath.wallet,
          label: 'شحن رصيد',
          onTap: () => navigationPush(context, const ChargeBalanceScreen(withBack: true,)),
        ),
        ActionCard(
          icon: AssetsPath.online_order,
          label: 'طلب مسبق',
          onTap: () => navigationPush(context, const OnlineOrderScreen()),
        ),
        ActionCard(
          icon: AssetsPath.banknotes,
          label: 'الحد اليومي',
          onTap: () => navigationPush(context, const DailyLimitScreen()),
        ),
        ActionCard(
          icon: AssetsPath.restore,
          label: 'عمليات الشراء',
          onTap: () => navigationPush(context, const PurchaseOperationScreen()),
        ),
        ActionCard(
          icon: AssetsPath.forbidden,
          label: 'الاطعمه المحذوفه',
          onTap: () => navigationPush(context, const DeletedFoodsPage()),
        ),
        ActionCard(
          icon: AssetsPath.credit_card,
          label: 'بطاقاتي',
          onTap: () => navigationPush(context, SavedCardsPage()),
        ),
      ],
    ),
  );
}
