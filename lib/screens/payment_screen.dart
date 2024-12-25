import 'package:flutter/material.dart';
import 'package:maqsaf_app/screens/success_payment_screen.dart';

import '../helpers/size_config.dart';
import '../widgets/components.dart';
import '../widgets/custom_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedPaymentMethod = 0;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final height = SizeConfig.sizeHeight(context);
    final width = SizeConfig.sizeWidth(context);

    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.grey[50],
          body: SizedBox(
            height: height,
            child: Stack(
              children: [
                ListView(
                  children: [
                    _buildAppBar(width),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildOrderSummary(width),
                          const SizedBox(height: 20),
                          _buildPaymentMethods(width),
                          const SizedBox(height: 20),
                          _buildPriceDetails(width),
                          const SizedBox(
                              height: 100), // Space for bottom button
                        ],
                      ),
                    ),
                  ],
                ),
                _buildBottomButton(width, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(double width) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
        gradient: LinearGradient(
          colors: [Color(0xff2D91C0), Color(0xff15445A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 0.9],
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Text(
            'الدفع',
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummary(double width) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.receipt_outlined,
                  color: const Color(0xff2D91C0), size: width * 0.06),
              const SizedBox(width: 10),
              Text(
                'ملخص الطلب',
                style: TextStyle(
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Divider(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ساندويتش تونة × 1',
                style: TextStyle(fontSize: width * 0.04),
              ),
              Text(
                '19.00 ر.س',
                style: TextStyle(fontSize: width * 0.04),
              ),
            ],
          ),
          if (true) ...[
            // Replace with actual extras check
            const SizedBox(height: 8),
            Text(
              'الإضافات:',
              style: TextStyle(
                fontSize: width * 0.035,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'صوص خاص',
              style: TextStyle(
                fontSize: width * 0.035,
                color: Colors.grey[600],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPaymentMethods(double width) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.payment,
                  color: const Color(0xff2D91C0), size: width * 0.06),
              const SizedBox(width: 10),
              Text(
                'طريقة الدفع',
                style: TextStyle(
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildPaymentOption(
            0,
            'Apple Pay',
            'assets/images/credit-card.png',
            width,
          ),
          const Divider(height: 16),
          _buildPaymentOption(
            1,
            'البطاقة الائتمانية',
            'assets/images/credit-card.png',
            width,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(
      int index, String title, String imagePath, double width) {
    return InkWell(
      onTap: () => setState(() => selectedPaymentMethod = index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selectedPaymentMethod == index
                      ? const Color(0xff2D91C0)
                      : Colors.grey,
                  width: 2,
                ),
              ),
              child: selectedPaymentMethod == index
                  ? const Center(
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Color(0xff2D91C0),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(fontSize: width * 0.04),
            ),
            const Spacer(),
            Image.asset(imagePath, height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceDetails(double width) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          _buildPriceRow('المجموع الفرعي', '19.00', width),
          const SizedBox(height: 8),
          _buildPriceRow('الإضافات', '0.00', width),
          const SizedBox(height: 8),
          _buildPriceRow('ضريبة القيمة المضافة (15%)', '2.85', width),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(),
          ),
          _buildPriceRow(
            'المجموع الكلي',
            '21.85',
            width,
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String title, String amount, double width,
      {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: width * (isTotal ? 0.045 : 0.04),
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Colors.black : Colors.grey[600],
          ),
        ),
        Text(
          '$amount ر.س',
          style: TextStyle(
            fontSize: width * (isTotal ? 0.045 : 0.04),
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? const Color(0xff2D91C0) : Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomButton(double width, BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: CustomButton(
          label: isLoading ? 'جارٍ الدفع...' : 'ادفع الآن - 21.85 ر.س',
          onTap: isLoading
              ? null
              : () async {
                  setState(() => isLoading = true);
                  // Simulate payment processing
                  await Future.delayed(const Duration(seconds: 2));
                  setState(() => isLoading = false);
                  if (mounted) {
                    navigationPush(context, const SuccessPaymentScreen());
                  }
                },
          txtSize: width * 0.04,
        ),
      ),
    );
  }
}
