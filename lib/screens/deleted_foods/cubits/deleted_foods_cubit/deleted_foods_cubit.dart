
import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maqsaf_app/core/widgets/shimmer/load_List.dart';

import 'package:maqsaf_app/core/widgets/widgets_Informative/error_view.dart';
import 'package:maqsaf_app/core/widgets/widgets_Informative/loading_data_view.dart';

import '../../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../../../../core/widgets/shimmer/load_circle_List.dart';
import '../../../../core/helpers/response_helper.dart';
import '../../../../core/widgets/widgets_Informative/empty_data_view.dart';
import '../../../items/data/models/food_model.dart';
import '../../../items/domain/repositories/items_repository.dart';


part 'deleted_foods_state.dart';
part 'deleted_foods_cubit.freezed.dart';

class DeletedFoodsCubit extends Cubit<DeletedFoodsState>  {
  final ItemsRepository repository;
  DeletedFoodsCubit(this.repository): super(const DeletedFoodsState.initial()){
  }



  List<FoodModel> items=[];
  List<FoodModel> itemsByFilter=[];


  int? selectedIngredientId;


  notify(){
    emit(const DeletedFoodsState.notify());
  }


  void init(BuildContext context)  {
    selectedIngredientId=null;
    getAllItems(context);


  }


void onRefresh(BuildContext context){

  getAllItems(context);
}

  Future<void> getAllItems(
      BuildContext context  ) async {
    items.clear();

    emit(const DeletedFoodsState.loading(),);

    final response = await repository.getAllItems( );
    response.when(
      success: (data) async {
        List list = data.result.list;

        items.addAll(list.whereType());
        filter();
        // if(items.isEmpty)
        //   emit(ItemsState.empty( data.message),);
        //  else
        // emit(ItemsState.success(items, data.message),);
      },
      failure: (networkException) {
        emit(DeletedFoodsState.failure(networkException),);
        ResponseHelper.onNetworkFailure(context,networkException:networkException);

      },
    );
  }

  filter() async {
    itemsByFilter.clear();

    items.forEach((element) {

      if(selectedIngredientId==null||(element.ingredients?.contains(selectedIngredientId)??false))
          itemsByFilter.add(element);

    });
    if(itemsByFilter.isEmpty)
      emit(DeletedFoodsState.empty( ""),);
    else
      emit(DeletedFoodsState.success(itemsByFilter,""),);
  }

  void changeIndex(int? id){
    selectedIngredientId=id;
    filter();
  }


  ///buildItemsPage
  bool buildItemsWhen(DeletedFoodsState previous,DeletedFoodsState current){
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

  Widget buildItems(BuildContext context,DeletedFoodsState state,Widget child)=>
      state.maybeWhen(
          loading:()=>const LoadingDataView(),
          failure: (networkExceptions)=>ErrorView(networkExceptions: networkExceptions,onRetry:()=>onRefresh(context)),
          empty:(_)=>EmptyDataView(),
          orElse: () =>child
      );

}


