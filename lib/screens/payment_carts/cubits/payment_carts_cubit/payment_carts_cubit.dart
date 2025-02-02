import 'dart:io';

import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:maqsaf_app/core/widgets/widgets_Informative/error_view.dart';

import '../../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../../../../core/widgets/shimmer/load_circle_List.dart';
import '../../../../core/helpers/response_helper.dart';
import '../../../../core/widgets/widgets_Informative/empty_data_view.dart';
import '../../../../core/widgets/widgets_Informative/loading_data_view.dart';
import '../../../profile/cubits/user_cubit/user_cubit.dart';
import '../../data/models/payment_cart_model.dart';

import '../../domain/repositories/payment_carts_repository.dart';


part 'payment_carts_state.dart';
part 'payment_carts_cubit.freezed.dart';

class PaymentCartsCubit extends Cubit<PaymentCartsState>  {
  final PaymentCartsRepository repository;
  PaymentCartsCubit(this.repository): super(const PaymentCartsState.initial()){
  }



  List<PaymentCartModel> items=[];





  notify(){
    emit(const PaymentCartsState.notify());
  }


  void init(BuildContext context)  {

    getAllPaymentCarts(context);

  }


void onRefresh(BuildContext context){

  getAllPaymentCarts(context);
}

  Future<void> getAllPaymentCarts(
      BuildContext context  ) async {
    items.clear();

    emit(const PaymentCartsState.loading(),);

    final response = await repository.getAllPaymentCarts( );
    response.when(
      success: (data) async {
        List list = data.result.list;

        items.addAll(list.whereType());
        if(items.isEmpty)
          emit(PaymentCartsState.empty( data.message),);
         else
        emit(PaymentCartsState.success(items, data.message),);
      },
      failure: (networkException) {
        emit(PaymentCartsState.failure(networkException),);
        ResponseHelper.onNetworkFailure(context,networkException:networkException);

      },
    );
  }
  setDefault(BuildContext context,{required int? paymentCartId}){
    // studentId??=  context.read<UserCubit>().user?.id;
    // if(!items.any((e)=>e.itemId==itemId&&studentId==studentId))
    //   items.add(PaymentCartModel(itemId: itemId,studentId: studentId));
    // emit(const PaymentCartsState.notify());
  }



  ///buildItemsPage
  bool buildItemsWhen(PaymentCartsState previous,PaymentCartsState current){
    if(current==previous) return false;
    return current.maybeWhen(
        loading: () =>true ,
        success: (_,__) =>true ,
        empty: (_) =>true ,
        failure: (_) =>true ,
        notify: () =>true ,
        changeIndex: (_) =>true ,
        orElse: () =>false
    );
  }

  Widget buildItems(BuildContext context,PaymentCartsState state,Widget child)=>
      state.maybeWhen(
          loading:()=>const LoadingDataView(),
          failure: (networkExceptions)=>ErrorView(networkExceptions: networkExceptions,onRetry:()=>onRefresh(context)),
          empty:(_)=>EmptyDataView(),
          orElse: () =>child
      );

}


