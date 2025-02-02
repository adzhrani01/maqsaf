import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:maqsaf_app/core/helpers/date_formate.dart';
import 'package:maqsaf_app/screens/orders/cubits/carts_cubit/orders_cubit.dart';
import '../../constants/colors_constants.dart';
import '../../core/helpers/helpers.dart';
import '../../helpers/size_config.dart';
import 'data/models/order_model.dart';

class PurchaseOperationScreen extends StatefulWidget {
  const PurchaseOperationScreen({super.key});

  @override
  State<PurchaseOperationScreen> createState() =>
      _PurchaseOperationScreenState();
}

class _PurchaseOperationScreenState extends State<PurchaseOperationScreen> {
  int selectedTab = 0;
  @override
  void initState() {
    context.read<OrdersCubit>().init(context);
    super.initState();
  }
  Widget _buildAppBar(double width) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2D91C0), Color(0xFF15445A)],
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: const Offset(0, 2),
            blurRadius: 10,
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                'عمليات الشراء',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar(double width) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(

          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context.read<OrdersCubit>().changeIndex(0);
                  setState(() => selectedTab = 0);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedTab == 0
                        ? const Color(0xFF15445A)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'الطلب المسبق',
                      style: TextStyle(
                        color:
                            selectedTab == 0 ? Colors.white : Colors.grey[600],
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
              context.read<OrdersCubit>().changeIndex(1);
              setState(() => selectedTab = 1);
              },
                child: Container(
                  decoration: BoxDecoration(

                    color: selectedTab == 1
                        ? const Color(0xFF15445A)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'الطلب المباشر',
                      style: TextStyle(
                        color:
                            selectedTab == 1 ? Colors.white : Colors.grey[600],
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderCard(int index, double width,OrderModel? item) {
    final statuses = ['ملغي', 'مكتمل', 'قيد التنفيذ', 'معلق'];
    final statusColors = {
      'ملغي': Colors.red,
      'مكتمل': Colors.green,
      'قيد التنفيذ': Colors.orange,
      'معلق': Colors.grey,
    };

    final status = item?.getArabicStatus??"معلق";
    // final status = statuses[index % statuses.length];
    final statusColor = statusColors[status];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     "#${ item?.id??"ORD-00${index+1}"}"
                     // "#${ item?.id??'${1000 + index}'}"
                      ,
                      style: TextStyle(
                        color: const Color(0xFF15445A),
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: statusColor?.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.calendar_today_outlined,
                        size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 8),
                    Text(
                      intl.DateFormat("dd-MM-yyyy").format( item?.date??DateTime.now()),
                      // '2024-10-22',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: width * 0.035,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          ...(item?.items??[]).map((item) => Row(
                            children: [
                              const Icon(Icons.circle, size: 8),
                              const SizedBox(width: 8),
                              Text("${item.item}",  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w500,
                                  ),),
                            ],
                          )),
                          // Text(
                          //   item.items
                          //   'ساندويتش زبدة فول سوداني',
                          //   style: TextStyle(
                          //     color: Colors.black87,
                          //     fontSize: width * 0.04,
                          //     fontWeight: FontWeight.w500,
                          //   ),
                          // ),
                          const SizedBox(height: 4),
                          Text(
                            '× ${item?.items?.length??1}',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: width * 0.035,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${item?.totalPrice??'--'} ر.س',
                      style: TextStyle(
                        color: const Color(0xFF15445A),
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = SizeConfig.sizeWidth(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient:     AppColor.myGradient??LinearGradient(
              colors: [Color(0xFF0DA9A6), Color(0xFF07A869)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              _buildAppBar(width),
              _buildTabBar(width),
              Expanded(
                child:
                BlocBuilder<OrdersCubit,OrdersState>(
                    buildWhen: (previous, current)=>context.read<OrdersCubit>().buildItemsWhen(previous, current),
                    builder: (context, state)=>
                        context.read<OrdersCubit>().buildItems(context, state,
                            ListView.builder(
                              itemCount:context.read<OrdersCubit>().itemsByFilter.length?? 10,
                              padding: const EdgeInsets.only(top: 8, bottom: 16),
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  _buildOrderCard(index, width,context.read<OrdersCubit>().itemsByFilter[index]),
                            ))
                )

              ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
