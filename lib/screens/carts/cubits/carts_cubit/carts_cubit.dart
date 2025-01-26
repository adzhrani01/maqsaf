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
import '../../data/models/cart_model.dart';
import '../../domain/repositories/carts_repository.dart';


part 'carts_state.dart';
part 'carts_cubit.freezed.dart';

class CartsCubit extends Cubit<CartsState>  {
  final CartsRepository repository;
  CartsCubit(this.repository): super(const CartsState.initial()){
  }



  List<CartModel> items=[];






  notify(){
    emit(const CartsState.notify());
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

    emit(const CartsState.loading(),);

    final response = await repository.getAllCarts( );
    response.when(
      success: (data) async {
        List list = data.result.list;

        items.addAll(list.whereType());
        if(items.isEmpty)
          emit(CartsState.empty( data.message),);
         else
        emit(CartsState.success(items, data.message),);
      },
      failure: (networkException) {
        emit(CartsState.failure(networkException),);
        ResponseHelper.onNetworkFailure(context,networkException:networkException);

      },
    );
  }


  ///buildItemsPage
  bool buildItemsWhen(CartsState previous,CartsState current){
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

  Widget buildItems(BuildContext context,CartsState state,Widget child)=>
      state.maybeWhen(
          loading:()=>const LoadCircleList(itemCount:5),
          failure: (networkExceptions)=>ErrorView(networkExceptions: networkExceptions,),
          empty:(_)=>EmptyDataView(),
          orElse: () =>child
      );

}


