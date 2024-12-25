import 'package:flutter/material.dart';
import 'package:maqsaf_app/screens/payment_screen.dart';
import 'package:maqsaf_app/screens/shopping_screen.dart';

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
  int quantity = 1;
  String selectedDate = 'اليوم';
  TimeOfDay selectedTime = TimeOfDay.now();
  final TextEditingController _notesController = TextEditingController();
  List<String> extras = ['خس إضافي', 'جبنة إضافية', 'صوص خاص'];
  List<bool> selectedExtras = [false, false, false];

  DateTime selectedDateValue = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateValue,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 7)),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDateValue) {
      setState(() {
        selectedDateValue = picked;
        selectedDate = picked.day == DateTime.now().day ? 'اليوم' : 'غداً';
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = SizeConfig.sizeHeight(context);
    final width = SizeConfig.sizeWidth(context);

    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            height: height,
            decoration: linearGradientDecoration(),
            child: ListView(
              children: [
                _buildAppBar(context, width),
                const SizedBox(height: 10),
                Image.asset(AssetsPath.food, height: height * 0.25),
                const SizedBox(height: 20),
                _buildDetailsSection(context, height, width),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, double width) {
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
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                const SizedBox(width: 8),
                Text(
                  'طلب مسبق',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.05,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsSection(
      BuildContext context, double height, double width) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ساندويتش تونه',
            style: TextStyle(
              color: Colors.black,
              fontSize: width * 0.05,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15),
          _buildRatingSection(width),
          const SizedBox(height: 15),
          _buildDescription(width),
          const SizedBox(height: 20),
          _buildQuantitySelector(width),
          const SizedBox(height: 20),
          _buildExtrasSection(width),
          const SizedBox(height: 20),
          _buildDeliveryTimeSelector(width),
          const SizedBox(height: 20),
          _buildNotesField(width),
          const SizedBox(height: 20),
          _buildOrderButtons(context, width),
        ],
      ),
    );
  }

  Widget _buildRatingSection(double width) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber),
        const SizedBox(width: 10),
        Text(
          'مفضله لدى طلاب الصف الرابع!',
          style: TextStyle(color: Colors.grey, fontSize: width * 0.04),
        ),
      ],
    );
  }

  Widget _buildDescription(double width) {
    return Text(
      'مناسبة لوجبة الغداء لو كان الطفل يظل وقت طويل خارج المنزل عبارة عن قطع الدجاج المقرمشة مع البروكلي المسلوق وملعقة مايونيز...',
      style: TextStyle(color: Colors.grey, fontSize: width * 0.04),
    );
  }

  Widget _buildQuantitySelector(double width) {
    return Row(
      children: [
        Text(
          'الكمية:',
          style: TextStyle(
            fontSize: width * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  if (quantity > 1) {
                    setState(() => quantity--);
                  }
                },
              ),
              Text(
                quantity.toString(),
                style: TextStyle(fontSize: width * 0.04),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => setState(() => quantity++),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExtrasSection(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'إضافات:',
          style: TextStyle(
            fontSize: width * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: List.generate(
            extras.length,
            (index) => FilterChip(
              selected: selectedExtras[index],
              label: Text(extras[index]),
              onSelected: (bool selected) {
                setState(() {
                  selectedExtras[index] = selected;
                });
              },
              selectedColor: AppColor.primaryColor.withOpacity(0.2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDeliveryTimeSelector(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'وقت التسليم:',
          style: TextStyle(
            fontSize: width * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => _selectDate(context),
                icon: const Icon(Icons.calendar_today),
                label: Text(
                  selectedDateValue.day == DateTime.now().day
                      ? 'اليوم'
                      : '${selectedDateValue.year}-${selectedDateValue.month}-${selectedDateValue.day}',
                  style: TextStyle(fontSize: width * 0.04),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColor.primaryColor,
                  side: BorderSide(color: AppColor.primaryColor),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
            const SizedBox(width: 20),
            TextButton(
              onPressed: () => _selectTime(context),
              child: Text(
                selectedTime.format(context),
                style: TextStyle(fontSize: width * 0.04),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNotesField(double width) {
    return TextField(
      controller: _notesController,
      decoration: InputDecoration(
        hintText: 'إضافة ملاحظات للطلب...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      maxLines: 2,
    );
  }

  Widget _buildOrderButtons(BuildContext context, double width) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: CustomButton(
            label: 'اطلب الآن',
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color:
                                        AppColor.primaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    Icons.shopping_bag_outlined,
                                    color: AppColor.primaryColor,
                                    size: width * 0.06,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  'تأكيد الطلب',
                                  style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(height: 30),

                            // Order Details
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey[200]!),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'ساندويتش تونه',
                                        style: TextStyle(
                                          fontSize: width * 0.045,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '× $quantity',
                                        style: TextStyle(
                                          fontSize: width * 0.045,
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (selectedExtras
                                      .any((selected) => selected)) ...[
                                    const SizedBox(height: 12),
                                    Text(
                                      'الإضافات:',
                                      style: TextStyle(
                                        fontSize: width * 0.04,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Wrap(
                                      spacing: 8,
                                      children: List.generate(
                                        extras.length,
                                        (index) => selectedExtras[index]
                                            ? Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 12,
                                                  vertical: 6,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: AppColor.primaryColor
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Text(
                                                  extras[index],
                                                  style: TextStyle(
                                                    fontSize: width * 0.035,
                                                    color:
                                                        AppColor.primaryColor,
                                                  ),
                                                ),
                                              )
                                            : const SizedBox.shrink(),
                                      ),
                                    ),
                                  ],
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time,
                                          size: width * 0.045,
                                          color: Colors.grey[600]),
                                      const SizedBox(width: 8),
                                      Text(
                                        'موعد التسليم: $selectedDate - ${selectedTime.format(context)}',
                                        style: TextStyle(
                                          fontSize: width * 0.04,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Total Price
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'السعر الإجمالي:',
                                    style: TextStyle(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${19 * quantity} ر.س',
                                    style: TextStyle(
                                      fontSize: width * 0.045,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),

                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      navigationPush(
                                          context, const CartScreen());
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.primaryColor
                                          .withOpacity(0.1),
                                      foregroundColor: AppColor.primaryColor,
                                      elevation: 0,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      'إضافة للسلة',
                                      style: TextStyle(fontSize: width * 0.04),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      navigationPush(
                                          context, const PaymentScreen());
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.primaryColor,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      'ادفع الآن',
                                      style: TextStyle(
                                        fontSize: width * 0.04,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            txtSize: width * 0.04,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: CustomButton(
            label: '${19 * quantity} س.ر',
            onTap: () {},
            primaryColor: AppColor.green,
            txtSize: width * 0.04,
          ),
        ),
      ],
    );
  }
}
