import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maqsaf_app/screens/profile/cubits/user_cubit/user_cubit.dart';
import '../constants/colors_constants.dart';
import '../helpers/size_config.dart';
import '../widgets/custom_button.dart';
import '../widgets/textfield.dart';

class ChargeBalanceScreen extends StatefulWidget {
  const ChargeBalanceScreen({super.key,  this.withBack=false});
  final bool withBack ;

  @override
  State<ChargeBalanceScreen> createState() => _ChargeBalanceScreenState();
}

class _ChargeBalanceScreenState extends State<ChargeBalanceScreen> {
  final List<String> amounts = ['10', '20', '50'];
  int selectedAmountIndex = -1;
  final _formKey = GlobalKey<FormState>();

  late TextEditingController balanceController =TextEditingController( );

  @override
  void initState() {
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
                'شحن رصيد',
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

  Widget _buildAmountSelector(double width) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: amounts.length,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          final isSelected = selectedAmountIndex == index;
          return GestureDetector(
            onTap: () {
              balanceController.text=amounts[index];
              setState(() => selectedAmountIndex = index);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              margin: const EdgeInsets.only(right: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF15445A) : Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: isSelected
                      ? Colors.transparent
                      : const Color(0xFF15445A).withOpacity(0.3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                '${amounts[index]} ر.س',
                style: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF15445A),
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
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
            gradient:  AppColor.myGradient??LinearGradient(
              colors: [Color(0xFF0DA9A6), Color(0xFF07A869)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              _buildAppBar(width),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'حدد المبلغ',
                                  style: TextStyle(
                                    color: const Color(0xFF15445A),
                                    fontSize: width * 0.045,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                _buildAmountSelector(width),
                                const SizedBox(height: 16),
                                 CustomTextfield(
                                  controller: balanceController,
                                  hintText: 'مبلغ آخر',
                                     validator:  (String? val) {
                                       if (val!.trim().isEmpty) return "هذا الحقل مطلوب";
                                       if (num.tryParse(val??'')==null) return "ادخال غير صالح";
                                       return null;
                                     }
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
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
                                CustomButton(
                                  label: 'Pay with Apple Pay',
                                  onTap: () {},
                                  txtSize: width * 0.04,
                                  textColor: Colors.white,
                                  primaryColor: Colors.black,
                                ),
                                const SizedBox(height: 20),
                                const Divider(height: 1),
                                const SizedBox(height: 20),
                                Text(
                                  'أو الدفع بالبطاقة',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: width * 0.04,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'اسم حامل البطاقة',
                                  style: TextStyle(
                                    color: const Color(0xFF15445A),
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const CustomTextfield(hintText: ''),
                                const SizedBox(height: 16),
                                Text(
                                  'رقم البطاقة',
                                  style: TextStyle(
                                    color: const Color(0xFF15445A),
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const CustomTextfield(
                                    hintText: 'xxxx xxxx xxxx xxxx'),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'تاريخ الانتهاء',
                                            style: TextStyle(
                                              color: const Color(0xFF15445A),
                                              fontSize: width * 0.04,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          const CustomTextfield(
                                              hintText: 'MM/YY'),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'CVV',
                                            style: TextStyle(
                                              color: const Color(0xFF15445A),
                                              fontSize: width * 0.04,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          const CustomTextfield(hintText: '***'),
                                        ],
                                      ),
                                    ),
                                  ],
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
              Container(
                padding: const EdgeInsets.all(24),
                child: CustomButton(
                  label: 'إضافة رصيد',
                  onTap: () {
                    if((_formKey.currentState?.validate()??false))
                      context.read<UserCubit>().updateStudents(context,
                          withBack: widget.withBack,
                          balance: "${
                              (num.tryParse(context.read<UserCubit>().user?.balance??"")??0)+
                              (num.tryParse(balanceController.value.text)??0)
                          }"
                      );

                  },
                  txtSize: width * 0.04,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
