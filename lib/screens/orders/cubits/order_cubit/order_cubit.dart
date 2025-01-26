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
      { int? itemId})  async {


    int? studentId=  context.read<UserCubit>().user?.id;
    LoadingDialog.show(context);
    final response = await repository.createOrder(
      itemId:itemId,
        studentId:studentId
    );
    response.when(
      success: (data) async {

        LoadingDialog.hide(context);
        ResponseHelper.onSuccess(context,message: data.message);
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
