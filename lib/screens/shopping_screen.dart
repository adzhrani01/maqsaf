import 'package:flutter/material.dart';
import 'package:maqsaf_app/screens/payment_screen.dart';
import 'package:maqsaf_app/widgets/components.dart';
import '../constants/colors_constants.dart';
import '../helpers/size_config.dart';
import '../widgets/custom_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [
    CartItem(
      name: "ساندويتش تونة",
      price: 19.0,
      quantity: 2,
      deliveryDate: "اليوم",
      deliveryTime: "12:30 م",
      notes: "بدون خس",
      extras: ["صوص خاص"],
    ),
    CartItem(
      name: "برجر دجاج",
      price: 25.0,
      quantity: 1,
      deliveryDate: "غداً",
      deliveryTime: "10:00 ص",
      notes: "",
      extras: ["جبنة إضافية", "صوص سبايسي"],
    ),
  ];

  double get totalAmount =>
      cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

  @override
  Widget build(BuildContext context) {
    final height = SizeConfig.sizeHeight(context);
    final width = SizeConfig.sizeWidth(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          height: height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff2D91C0), Color(0xff15445A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              _buildAppBar(width),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: cartItems.isEmpty
                            ? _buildEmptyCart(width)
                            : _buildCartList(width),
                      ),
                      if (cartItems.isNotEmpty) _buildCartSummary(width),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(double width) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            const SizedBox(width: 8),
            Text(
              'السلة',
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              '${cartItems.length} عناصر',
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.04,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyCart(double width) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: width * 0.2,
            color: Colors.grey,
          ),
          const SizedBox(height: 20),
          Text(
            'السلة فارغة',
            style: TextStyle(
              fontSize: width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'ابدأ بإضافة بعض العناصر إلى سلتك',
            style: TextStyle(
              fontSize: width * 0.04,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartList(double width) {
    return ListView.separated(
      itemCount: cartItems.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final item = cartItems[index];
        return Dismissible(
          key: Key(item.name + index.toString()),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20),
            color: Colors.red,
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (direction) {
            setState(() {
              cartItems.removeAt(index);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('تم حذف ${item.name}')),
            );
          },
          child: _buildCartItem(item, width),
        );
      },
    );
  }

  Widget _buildCartItem(CartItem item, double width) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'موعد التسليم: ${item.deliveryDate} - ${item.deliveryTime}',
                      style: TextStyle(
                        fontSize: width * 0.035,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '${item.price * item.quantity} ر.س',
                style: TextStyle(
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
          if (item.extras.isNotEmpty) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: item.extras
                  .map((extra) => Chip(
                        label: Text(
                          extra,
                          style: TextStyle(fontSize: width * 0.03),
                        ),
                        backgroundColor: AppColor.primaryColor.withOpacity(0.1),
                      ))
                  .toList(),
            ),
          ],
          if (item.notes.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              'ملاحظات: ${item.notes}',
              style: TextStyle(
                fontSize: width * 0.035,
                color: Colors.grey[600],
              ),
            ),
          ],
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {
                  setState(() {
                    if (item.quantity > 1) {
                      item.quantity--;
                    }
                  });
                },
              ),
              Text(
                item.quantity.toString(),
                style: TextStyle(fontSize: width * 0.04),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: () {
                  setState(() {
                    item.quantity++;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCartSummary(double width) {
    return Column(
      children: [
        const Divider(thickness: 1),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'المجموع الكلي:',
              style: TextStyle(
                fontSize: width * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${(totalAmount).toStringAsFixed(2)} ر.س',
              style: TextStyle(
                fontSize: width * 0.045,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        CustomButton(
          label: 'متابعة عملية الدفع',
          onTap: () {
            navigationPush(context, const PaymentScreen());
          },
          txtSize: width * 0.04,
        ),
      ],
    );
  }
}

class CartItem {
  final String name;
  final double price;
  int quantity;
  final String deliveryDate;
  final String deliveryTime;
  final String notes;
  final List<String> extras;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.deliveryDate,
    required this.deliveryTime,
    required this.notes,
    required this.extras,
  });
}
