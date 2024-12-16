import 'package:flutter/material.dart';
import '../helpers/size_config.dart';
import '../widgets/custom_button.dart';
import '../widgets/textfield.dart';

class DailyLimitScreen extends StatefulWidget {
  const DailyLimitScreen({super.key});

  @override
  State<DailyLimitScreen> createState() => _DailyLimitScreenState();
}

class _DailyLimitScreenState extends State<DailyLimitScreen> {
  final _formKey = GlobalKey<FormState>();

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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'الحد اليومي',
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = SizeConfig.sizeHeight(context);
    final width = SizeConfig.sizeWidth(context);

    return Directionality(
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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildAppBar(width),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.02),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Color(0xff15445A),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'الحد اليومي للطالب',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.045,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const CustomTextfield(
                                hintText: 'أدخل الحد اليومي',
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.info_outline,
                                    color: Colors.white70,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'يجب أن يكون الحد اليومي أكثر من 1 س.ر',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: width * 0.03,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.04),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xff15445A).withOpacity(0.2),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: const Color(0xff15445A)
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Icon(
                                      Icons.lightbulb_outline,
                                      color: Color(0xff15445A),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'نصيحة مالية',
                                    style: TextStyle(
                                      color: const Color(0xff15445A),
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'يساعد وضع حد يومي للطالب في تنظيم مصاريفه وتشجيعه على إدارة ميزانيته بشكل أفضل، بالإضافة إلى منع الإنفاق الزائد وضمان عدم تجاوز المبالغ المحددة.',
                                style: TextStyle(
                                  color: const Color(0xff15445A),
                                  fontSize: width * 0.035,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 250),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.20),
                          child: CustomButton(
                            label: 'حفظ',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {}
                            },
                            txtSize: width * 0.04,
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
      ),
    );
  }
}
