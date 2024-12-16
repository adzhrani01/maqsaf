import 'package:flutter/material.dart';
import 'package:maqsaf_app/screens/success_payment_screen.dart';
import 'package:maqsaf_app/widgets/calender.dart';

import '../helpers/size_config.dart';
import '../widgets/components.dart';
import '../widgets/custom_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    final height = SizeConfig.sizeHeight(context);
    final width = SizeConfig.sizeWidth(context);

    return SafeArea(
        child: Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: height,
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                  gradient: LinearGradient(
                      colors: [Color(0xff2D91C0), Color(0xff15445A)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0, 0.9]),
                ),
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                )),
                            const SizedBox(width: 8),
                            Text('الدفع',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.05)),
                          ],
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Text('ملخص الطلب',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black, fontSize: width * 0.05)),
                    const SizedBox(height: 10),
                    ListTile(
                      title: Text('الطلب',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.grey, fontSize: width * 0.05)),
                      trailing: Text('19.00',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.grey, fontSize: width * 0.05)),
                    ),
                    ListTile(
                      title: Text('الإضافات',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.grey, fontSize: width * 0.05)),
                      trailing: Text('0.00',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.grey, fontSize: width * 0.05)),
                    ),
                    ListTile(
                      title: Text('ضريبه القيمه المضافه (15%)',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.grey, fontSize: width * 0.04)),
                      trailing: Text('2.85',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.grey, fontSize: width * 0.05)),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    ListTile(
                      title: Text('المجموع',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.grey, fontSize: width * 0.05)),
                      trailing: Text('21.85',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.grey, fontSize: width * 0.05)),
                    ),
                    Container(
                      child: const SizedBox(
                        height: 320,
                        child: CustomCalendar(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      label: 'إدفع الأن',
                      onTap: () {
                        navigationPush(context, const SuccessPaymentScreen());
                      },
                      txtSize: width * 0.04,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}


