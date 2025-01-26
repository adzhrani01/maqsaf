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
import '../../data/models/food_model.dart';
import '../../domain/repositories/items_repository.dart';


part 'items_state.dart';
part 'items_cubit.freezed.dart';

class ItemsCubit extends Cubit<ItemsState>  {
  final ItemsRepository repository;
  ItemsCubit(this.repository): super(const ItemsState.initial()){
  }



  List<FoodModel> items=[];
  List<FoodModel> itemsByFilter=[];





  notify(){
    emit(const ItemsState.notify());
  }


  void init(BuildContext context)  {

    getAllItems(context);

  }


void onRefresh(BuildContext context){

  getAllItems(context);
}

  Future<void> getAllItems(
      BuildContext context  ) async {
    items.clear();

    emit(const ItemsState.loading(),);

    final response = await repository.getAllItems( );
    response.when(
      success: (data) async {
        List list = data.result.list;

        items.addAll(list.whereType());
        if(items.isEmpty)
          emit(ItemsState.empty( data.message),);
         else
        emit(ItemsState.success(items, data.message),);
      },
      failure: (networkException) {
        emit(ItemsState.failure(networkException),);
        ResponseHelper.onNetworkFailure(context,networkException:networkException);

      },
    );
  }


  ///buildItemsPage
  bool buildItemsWhen(ItemsState previous,ItemsState current){
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

  Widget buildItems(BuildContext context,ItemsState state,Widget child)=>
      state.maybeWhen(
          loading:()=>const LoadCircleList(itemCount:5),
          failure: (networkExceptions)=>ErrorView(networkExceptions: networkExceptions,),
          empty:(_)=>EmptyDataView(),
          orElse: () =>child
      );

}


