
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

  @override
  Widget build(BuildContext context) {
    final height = SizeConfig.sizeHeight(context);
    final width = SizeConfig.sizeWidth(context);

    return  SafeArea(child: Directionality(
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
                  borderRadius:BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
                  gradient: LinearGradient(
                      colors: [Color(0xff2D91C0),Color(0xff15445A)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0,0.9]
                  ),
                ),
                child:Row(
                  children: [
                    Expanded(flex:2,child:  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
                        const SizedBox(width: 8),
                        Text( 'الدفع', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: width * 0.05)),
                      ],
                    )),

                  ],
                ),
              ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Text( 'ملخص الطلب', textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: width * 0.05)),
                  const SizedBox(height: 10),
                  ListTile(
                    title: Text( 'الطلب', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize: width * 0.05)),
                    trailing: Text( '19.00', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize: width * 0.05)),
                  ),
                  ListTile(
                    title: Text( 'الإضافات', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize: width * 0.05)),
                    trailing: Text( '0.00', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize: width * 0.05)),
                  ),
                  ListTile(
                    title: Text( 'ضريبه القيمه المضافه (15%)', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize: width * 0.04)),
                    trailing: Text( '2.85', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize: width * 0.05)),
                  ),
                  const Divider(color: Colors.grey,),
                  ListTile(
                    title: Text( 'المجموع', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize: width * 0.05)),
                    trailing: Text( '21.85', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize: width * 0.05)),
                  ),
                  SizedBox(height: height * 0.35),
                  CustomButton(
                    label: 'إدفع الأن',
                    onTap: () {
                      navigationPush(context, const SuccessPaymentScreen());
                    },
                    txtSize: width * 0.04,
                  ),
                ],
              ),)






            ],
          ),
        ),
      ),
    ));
  }
}




// import 'package:flutter/material.dart';
// import 'package:maqsaf_app/screens/success_payment_screen.dart';
// import '../helpers/size_config.dart';
// import '../widgets/components.dart';
// import '../widgets/custom_button.dart';

// class PaymentScreen extends StatefulWidget {
//   const PaymentScreen({super.key});

//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//   Widget _buildAppBar(double width) {
//     return Container(
//       padding: const EdgeInsets.only(top: 15, bottom: 15),
//       decoration: BoxDecoration(
//         color: const Color(0xFF15445A),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             offset: const Offset(0, 4),
//             blurRadius: 10,
//           )
//         ],
//       ),
//       child: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.2),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: InkWell(
//                   onTap: () => Navigator.pop(context),
//                   child: const Icon(
//                     Icons.arrow_back,
//                     color: Colors.white,
//                     size: 20,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 16),
//               Text(
//                 'الدفع',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: width * 0.05,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildOrderSummaryItem(String title, String amount, double width,
//       {bool isTotal = false, bool isVAT = false}) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//       decoration: BoxDecoration(
//         color: isTotal
//             ? const Color(0xFF15445A).withOpacity(0.05)
//             : Colors.transparent,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               color: isTotal ? const Color(0xFF15445A) : Colors.grey.shade700,
//               fontSize: isVAT ? width * 0.035 : width * 0.04,
//               fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
//             ),
//           ),
//           Text(
//             '$amount ر.س',
//             style: TextStyle(
//               color: isTotal ? const Color(0xFF15445A) : Colors.grey.shade700,
//               fontSize: width * 0.04,
//               fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = SizeConfig.sizeHeight(context);
//     final width = SizeConfig.sizeWidth(context);

//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Column(
//           children: [
//             _buildAppBar(width),
//             Expanded(
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Padding(
//                   padding: const EdgeInsets.all(24),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(20),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.05),
//                               blurRadius: 10,
//                               offset: const Offset(0, 5),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Container(
//                                   padding: const EdgeInsets.all(8),
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xFF15445A)
//                                         .withOpacity(0.1),
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                   child: const Icon(
//                                     Icons.receipt_long_rounded,
//                                     color: Color(0xFF15445A),
//                                     size: 20,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 12),
//                                 Text(
//                                   'ملخص الطلب',
//                                   style: TextStyle(
//                                     color: const Color(0xFF15445A),
//                                     fontSize: width * 0.045,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 20),
//                             _buildOrderSummaryItem('الطلب', '19.00', width),
//                             _buildOrderSummaryItem('الإضافات', '0.00', width),
//                             _buildOrderSummaryItem(
//                               'ضريبة القيمة المضافة (15%)',
//                               '2.85',
//                               width,
//                               isVAT: true,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 16),
//                               child: Divider(
//                                 color: Colors.grey.shade200,
//                                 thickness: 1,
//                               ),
//                             ),
//                             _buildOrderSummaryItem(
//                               'المجموع',
//                               '21.85',
//                               width,
//                               isTotal: true,
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 24),
//                       Container(
//                         padding: const EdgeInsets.all(20),
//                         decoration: BoxDecoration(
//                           color: const Color(0xFF15445A).withOpacity(0.05),
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.info_outline,
//                               color: const Color(0xFF15445A),
//                               size: width * 0.05,
//                             ),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: Text(
//                                 'سيتم خصم المبلغ من رصيد محفظتك',
//                                 style: TextStyle(
//                                   color: const Color(0xFF15445A),
//                                   fontSize: width * 0.035,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.all(24),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     offset: const Offset(0, -4),
//                     blurRadius: 16,
//                   ),
//                 ],
//               ),
//               child: CustomButton(
//                 label: 'إتمام الدفع',
//                 onTap: () =>
//                     navigationPush(context, const SuccessPaymentScreen()),
//                 txtSize: width * 0.04,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
