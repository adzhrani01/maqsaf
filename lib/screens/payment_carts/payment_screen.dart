import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:maqsaf_app/screens/payment_carts/widgets/choose_cart.dart';
import 'package:maqsaf_app/screens/profile/cubits/user_cubit/user_cubit.dart';
import 'package:maqsaf_app/screens/success_payment_screen.dart';

import '../../constants/colors_constants.dart';
import '../../core/data/enums/toast_status.dart';
import '../../core/domain/error_handler/message.dart';
import '../../core/widgets/constants_widgets.dart';
import '../../helpers/size_config.dart';
import '../../widgets/components.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/textfield.dart';
import '../carts/cubits/item_cart_cubit/item_cart_cubit.dart';
import '../carts/data/models/item_cart_model.dart';
import '../orders/cubits/order_cubit/order_cubit.dart';
import 'cubits/payment_carts_cubit/payment_carts_cubit.dart';
import 'data/models/payment_cart_model.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.items});
  final List<ItemCartModel> items;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedPaymentMethod = 0;
  bool isLoading = false;
  final controller=TextEditingController();
  final cardHolderNameController=TextEditingController();
  final cardNumberController=TextEditingController();
  final expiryDateController=TextEditingController();
  final cvvController=TextEditingController();
  final _formKey = GlobalKey<FormState>();

  PaymentCartModel? paymentCard;
  @override
  void initState() {
    context.read<PaymentCartsCubit>().init(context);
    super.initState();
  }


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
            child: Container(
              decoration: BoxDecoration(
                  gradient:
                  AppColor.myGradient),
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
                            if(selectedPaymentMethod == 0)...[
                              ChooseCart(
                                controller:controller,
                                onChange: (paymentCard1){
                                  controller.text=paymentCard1?.number??'';
                                  paymentCard=paymentCard1;


                                },
                              ),
                              const SizedBox(height: 20),
                            ],
                            if(selectedPaymentMethod == 2)...[
                              Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                           CustomTextfield(
                                          controller: cardHolderNameController,
                                              hintText: '',
                                             validator: (value) {
                                               if (value == null || value.isEmpty) {
                                                 return 'الرجاء إدخال اسم حامل البطاقة';
                                               }
                                               return null;
                                             },),
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
                                           CustomTextfield(
                                             controller: cardNumberController,
                                              hintText: 'xxxx xxxx xxxx xxxx',
                                             validator: (value) {
                                               if (value == null || value.isEmpty) {
                                                 return 'الرجاء إدخال رقم البطاقة';
                                               }
                                               return null;
                                             },),
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
                                                     CustomTextfield(
                                                      controller: expiryDateController,
                                                        hintText: 'MM/YY',
                                                       validator: (value) {
                                                         if (value == null || value.isEmpty) {
                                                           return 'الرجاء إدخال تاريخ الانتهاء';
                                                         }

                                                         if(intl.DateFormat("MM/yy").tryParse(value)==null
                                                             &&intl.DateFormat("MM\\yy").tryParse(value)==null
                                                         ) return 'الرجاء إدخال تاريخ صحيح';

                                                         if(
                                                         (intl.DateFormat("MM/yy").tryParse(value)?.isBefore(DateTime.now())??true)
                                                             &&(intl.DateFormat("MM\\yy").tryParse(value)?.isBefore(DateTime.now())??true)

                                                         )
                                                           return 'الرجاء إدخال تاريخ صالح';
                                                         return null;
                                                       },),
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
                                                     CustomTextfield(
                                                        controller: cvvController,
                                                        hintText: '***',
                                                       validator: (value) {
                                                         if (value == null || value.isEmpty) {
                                                           return 'الرجاء إدخال تاريخ الانتهاء';
                                                         }
                                                         if(value.length!=3) return 'الرجاء إدخال رقم صالح';

                                                         return null;
                                                       },),
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
                              const SizedBox(height: 20),
                            ],
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
        boxShadow: [
          BoxShadow(
            color: AppColor.blackColor,
            blurRadius: 10,
            offset: const Offset(0, 0.5),
          ),
        ],
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
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 ...(widget.items).map((item) =>

                 Text(
                   '${item.item?.name?? ''} × 1',
                   style: TextStyle(fontSize: width * 0.04),))
               ],
             ),
              // Text(
              //   'ساندويتش تونة × 1',
              //   style: TextStyle(fontSize: width * 0.04),
              // ),
              Text(
    '${context.read<ItemCartCubit>().totalAmount(widget.items).toStringAsFixed(2)} ر.س',

                // '19.00 ر.س',
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
            ...(widget.items).map((item) =>
            (item.extras??[]).isEmpty?
                SizedBox.shrink()
        :
                Text("${item.extras}",        style: TextStyle(
              fontSize: width * 0.035,
              color: Colors.grey[600],
            ),))
            // Text(
            //   'صوص خاص',
            //   // 'صوص خاص',
            //   style: TextStyle(
            //     fontSize: width * 0.035,
            //     color: Colors.grey[600],
            //   ),
            // ),
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
            'البطاقة الائتمانية',
            // 'Apple Pay',
            'assets/images/credit-card.png',
            width,
          ),
          const Divider(height: 16),
          _buildPaymentOption(
            1,
            'رصيد الطالب (${context.read<UserCubit>().user?.balance??'-'})',
            'assets/images/credit-card.png',
            width,
            icon: Icons.monetization_on_outlined
          ),

          const Divider(height: 16),
          _buildPaymentOption(
            2,
            'ادخال بطاقة أخرى',
            'assets/images/credit-card.png',
            width,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(
      int index, String title, String imagePath, double width
      ,{IconData? icon}
      ) {
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
            icon!=null?
                Icon(icon,size: 30,)
                :
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
          _buildPriceRow('المجموع الفرعي', "${context.read<ItemCartCubit>().totalAmount(widget.items).toStringAsFixed(2)}", width),
          // _buildPriceRow('المجموع الفرعي', '19.00', width),
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
            "${context.read<ItemCartCubit>().totalAmountWithTax(widget.items,withTax: 0.15).toStringAsFixed(2)}",
            // '21.85',
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
          label: isLoading ? 'جارٍ الدفع...' : 'ادفع الآن ${context.read<ItemCartCubit>().totalAmountWithTax(widget.items,withTax: 0.15).toStringAsFixed(2)
            } ر.س',
          // label: isLoading ? 'جارٍ الدفع...' : 'ادفع الآن - 21.85 ر.س',
          onTap: isLoading
              ? null
              : () async {
            if(selectedPaymentMethod==0&&paymentCard==null){
              ConstantsWidgets.TOAST(null, title: ToastStatus.failure.name,textToast:MessageApi.findTextToast("يجب عليك اختيار بطاقة") , state: false);
              return;
            }


            else if(selectedPaymentMethod==1&&

                (num.tryParse("${context.read<UserCubit>().user?.balance}")??0)-
                    (num.tryParse('${context.read<ItemCartCubit>().totalAmountWithTax(widget.items,withTax: 0.15)}')??0)<0
            )
            {
              ConstantsWidgets.TOAST(null, title: ToastStatus.failure.name,textToast:MessageApi.findTextToast("قيمة الرصيد غير كافية") , state: false);
              return;
            }
           else if(selectedPaymentMethod==2&&!(_formKey.currentState?.validate()??false))
              return;
            context.read<OrderCubit>().createOrder(context,items: widget.items,paymentCart: paymentCard,paymentType: selectedPaymentMethod);
                  // setState(() => isLoading = true);
                  // // Simulate payment processing
                  // await Future.delayed(const Duration(seconds: 2));
                  // setState(() => isLoading = false);
                  // if (mounted) {
                  //   navigationPush(context, const SuccessPaymentScreen());
                  // }
                },
          txtSize: width * 0.04,
        ),
      ),
    );
  }
}
