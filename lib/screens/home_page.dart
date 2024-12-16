import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maqsaf_app/constants/assets_path.dart';
import 'package:maqsaf_app/screens/card_page.dart';
import 'package:maqsaf_app/screens/charge_balance_screen.dart';
import 'package:maqsaf_app/screens/daily_limit_screeen.dart';
import 'package:maqsaf_app/screens/food_removed_screen.dart';
import 'package:maqsaf_app/screens/online_order_screen.dart';
import 'package:maqsaf_app/screens/purchase_operation_screen.dart';
import 'package:maqsaf_app/screens/select_student_screen.dart';
import 'package:maqsaf_app/widgets/actionCard.dart';
import 'package:maqsaf_app/widgets/components.dart';
import 'package:maqsaf_app/widgets/orderr.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0DA9A6), Color(0xFF07A869)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: CustomScrollView(
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
                      gradient: LinearGradient(
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
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.menu,
                                      color: Colors.white),
                                  onPressed: () {
                                    navigationPush(
                                        context, SelectStudentScreen());
                                  },
                                ),
                                Container()
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
                                    backgroundImage: AssetImage(
                                        AssetsPath.rectangle_student),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
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
                                      _buildHeaderStat('الحد اليومي', '10 س.ر'),
                                      Container(
                                        height: 40,
                                        width: 1,
                                        color: Colors.white.withOpacity(0.3),
                                      ),
                                      _buildHeaderStat(
                                          'الرصيد الحالي', '55 س.ر'),
                                      Container(
                                        height: 40,
                                        width: 1,
                                        color: Colors.white.withOpacity(0.3),
                                      ),
                                      _buildHeaderStat('رقم الطالب', '0001'),
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
                              ),
                            ),
                            const SizedBox(height: 20),
                            _buildGridMenu(context),
                          ],
                        ),
                      ),
                      CafeteriaOrdersWidget(),
                    ],
                  ),
                ),
              ],
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
          onTap: () => navigationPush(context, const ChargeBalanceScreen()),
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
