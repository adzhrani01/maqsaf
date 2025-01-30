import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maqsaf_app/screens/carts/data/models/item_cart_model.dart';
import 'package:maqsaf_app/screens/orders/data/models/item_order_model.dart';
import 'package:maqsaf_app/screens/orders/data/models/order_model.dart';
import 'package:maqsaf_app/screens/profile/cubits/user_cubit/user_cubit.dart';

import '../../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../../../../../core/widgets/widgets_Informative/error_view.dart';
import '../../../../../core/widgets/widgets_Informative/empty_data_view.dart';
import '../../../../../core/widgets/widgets_Informative/loading_data_view.dart';
import '../../../../core/dialogs/loading_dialog.dart';
import '../../../../core/helpers/response_helper.dart';
import '../../../../widgets/components.dart';
import '../../../carts/cubits/item_cart_cubit/item_cart_cubit.dart';
import '../../../payment_carts/data/models/payment_cart_model.dart';
import '../../../success_payment_screen.dart';
import '../../domain/repositories/orders_repository.dart';


part 'order_state.dart';
part 'order_cubit.freezed.dart';

class OrderCubit extends Cubit<OrderState>  {
  final OrdersRepository repository;
  OrderCubit(this.repository): super(const OrderState.initial());
  OrderModel? order;
  ItemOrderModel? itemOrder;
  // int? priceOfferId;


  void init(BuildContext context)  {
    order=null;
    itemOrder=null;


  }



  Future<void> createOrder(BuildContext context,
      { required List<ItemCartModel> items
        ,int? paymentType,PaymentCartModel? paymentCart
      })  async {


    int? studentId=  context.read<UserCubit>().user?.id;
    LoadingDialog.show(context);
    final response = await repository.createOrder(
        paymentCart: paymentCart,
        paymentType: paymentType,
        items: items,
        totalPrice: "${context.read<ItemCartCubit>().totalAmountWithTax(items,withTax: 0.15).toStringAsFixed(2)}",
        studentId:studentId
    );
    response.when(
      success: (data) async {
        if(paymentType==1)
          await  context.read<UserCubit>().updateBalanceStudents(context,
              balance: "${
                  (num.tryParse(context.read<UserCubit>().user?.balance??"")??0)-
                      (num.tryParse("${context.read<ItemCartCubit>().totalAmountWithTax(items,withTax: 0.15)}")??0)
              }"
          );
        LoadingDialog.hide(context);

        if(context.read<ItemCartCubit>().cartModel?.items?.length==items.length)
          context.read<ItemCartCubit>().cartModel?.items?.clear();


        ResponseHelper.onSuccess(context,message: data.message);
        navigationPush(context, const SuccessPaymentScreen());

        // onRefreshItem(context, priceOfferId: priceOfferId);
        // context.read<PriceOfferFullsCubit>().onRefresh();
      },
      failure: (networkException) {
        LoadingDialog.hide(context);
        ResponseHelper.onNetworkFailure(context,networkException: networkException);

      },
    );
  }




  ///buildSubmitCoursePage
  bool buildItemWhen(OrderState previous,OrderState current){
    if(current==previous) return false;
    return current.maybeWhen(
        loading: () =>true ,
        success: (_,__) =>true ,
        failure: (_) =>true ,
        empty: (_) =>true,
        orElse: () =>false
    );
  }
  Widget buildItem(BuildContext context,OrderState state,Widget child)=>
      state.maybeWhen(

          loading:()=>LoadingDataView(),
          failure: (networkExceptions)=> ErrorView(networkExceptions:networkExceptions),
          empty:(_)=>EmptyDataView(),
          orElse: () =>child
      );

}
