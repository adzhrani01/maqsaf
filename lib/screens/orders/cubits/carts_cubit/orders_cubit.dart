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
import '../../data/models/order_model.dart';
import '../../domain/repositories/orders_repository.dart';


part 'orders_state.dart';
part 'orders_cubit.freezed.dart';

class OrdersCubit extends Cubit<OrdersState>  {
  final OrdersRepository repository;
  OrdersCubit(this.repository): super(const OrdersState.initial()){
  }



  List<OrderModel> items=[];






  notify(){
    emit(const OrdersState.notify());
  }


  void init(BuildContext context)  {

    getAllCarts(context);

  }


void onRefresh(BuildContext context){

  getAllCarts(context);
}

  Future<void> getAllCarts(
      BuildContext context  ) async {
    items.clear();

    emit(const OrdersState.loading(),);

    final response = await repository.getAllOrders( );
    response.when(
      success: (data) async {
        List list = data.result.list;

        items.addAll(list.whereType());
        if(items.isEmpty)
          emit(OrdersState.empty( data.message),);
         else
        emit(OrdersState.success(items, data.message),);
      },
      failure: (networkException) {
        emit(OrdersState.failure(networkException),);
        ResponseHelper.onNetworkFailure(context,networkException:networkException);

      },
    );
  }


  ///buildItemsPage
  bool buildItemsWhen(OrdersState previous,OrdersState current){
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

  Widget buildItems(BuildContext context,OrdersState state,Widget child)=>
      state.maybeWhen(
          loading:()=>const LoadCircleList(itemCount:5),
          failure: (networkExceptions)=>ErrorView(networkExceptions: networkExceptions,),
          empty:(_)=>EmptyDataView(),
          orElse: () =>child
      );

}


