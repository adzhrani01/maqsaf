import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maqsaf_app/constants/colors_constants.dart';
import 'package:maqsaf_app/core/dialogs/logout_dialog.dart';
import 'package:maqsaf_app/core/helpers/extensions.dart';
import 'package:maqsaf_app/screens/payment_carts/data/models/payment_cart_model.dart';

import '../../../core/dialogs/global_bottom_sheet.dart';
import '../../../core/widgets/widgets_Informative/loading_data_view.dart';
import '../cubits/payment_carts_cubit/payment_carts_cubit.dart';

class ChooseCart extends StatelessWidget {
   ChooseCart({super.key, this.onChange, this.controller});
  final Function(PaymentCartModel?)? onChange;
  final TextEditingController? controller;

  int? selectIndex;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 54,
      padding: const EdgeInsets.symmetric(vertical: 2) ,

      decoration: BoxDecoration(


          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],

          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        readOnly: true,
        onTap: () async {
          await globalBottomSheet(
            title: "اختيار بطاقة الائتمان",
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                BlocBuilder<PaymentCartsCubit,PaymentCartsState>(
                    buildWhen: (previous, current)=>context.read<PaymentCartsCubit>().buildItemsWhen(previous, current),
                    builder: (context, state)=>
                        context.read<PaymentCartsCubit>().buildItems(context, state,
                            StatefulBuilder(
                                builder: (context,setState1) {
                                return ListView.builder(
                                  shrinkWrap:true,
                                  itemCount: context.read<PaymentCartsCubit>().items.length,
                                  itemBuilder: (context, index) {
                                    final card = context.read<PaymentCartsCubit>().items[index];
                                    return   GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () async {
                                       setState1(() {
                                         selectIndex=index;
                                       });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          bottom: 16.h,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.h,
                                          horizontal: 10.w,
                                        ),
                                        decoration: BoxDecoration(

                                          color: const Color(0xffffffff),
                                          borderRadius:
                                          BorderRadius.circular(15.0),
                                          border: Border.all(
                                              width: 1.0,
                                              color: const Color(0xffeaeaea)),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x1a000000),
                                              offset: Offset(0, 1),
                                              blurRadius: 6,
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 40.w,
                                                    height: 40.h,
                                                    decoration: BoxDecoration(

                                                      borderRadius:
                                                      BorderRadius.circular(
                                                        10.r,
                                                      ),
                                                      border: Border.all(
                                                        color: AppColor.primaryColor,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child: Icon(Icons.credit_card,color: AppColor.secondaryColor,),
                                                  ),
                                                  SizedBox(width: 10.w),
                                                  Flexible(
                                                    child: Text(
                                                        card.number??"",
                                                     style: TextStyle(
                                                      fontSize: 16,
                                                      color: AppColor.primaryColor,)
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            Container(
                                              width: 25.w,
                                              height: 25.h,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: selectIndex==index
                                                      ? AppColor.primaryColor
                                                      : Colors.grey
                                                      .withOpacity(0.8),
                                                  width: 1,
                                                ),
                                              ),
                                              child: Center(
                                                child: Container(
                                                  width: 15.w,
                                                  height: 15.h,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: selectIndex==index
                                                        ? AppColor.primaryColor
                                                        : null,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            ))
                )
               ,
                SizedBox(height: 32.h),
                ElevatedButton(
                  onPressed: () {
                    context.pop();
                    onChange!=null?onChange?.call(
                        selectIndex==null?
                            null:
                        context.read<PaymentCartsCubit>().items[selectIndex!]):"";
                  },
                  child: Text("تأكيد",style: TextStyle(fontSize: 16),),
                ),
                SizedBox(height: 16.h),
              ],
            ), context: context,
          );
        },
        textAlign: TextAlign.start,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            border: InputBorder.none,
            hintText:  "اختر البطاقة الائتمانية",
            hintStyle: TextStyle(color: Colors.grey)),
        textDirection:
        // contextlocale?.languageCode == "ar"
        //     ?
        TextDirection.rtl,
            // : TextDirection.ltr,
        // hintText: "البطاقة الائتمانية",
        controller: controller,
        maxLines: 1,

      ),
    );
  }
}
