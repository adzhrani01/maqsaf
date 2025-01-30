
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
import '../../../items/cubits/items_cubit/items_cubit.dart';
import '../../../profile/cubits/user_cubit/user_cubit.dart';
import '../../data/models/favorite_model.dart';

import '../../domain/repositories/favorites_repository.dart';


part 'favorites_state.dart';
part 'favorites_cubit.freezed.dart';

class FavoritesCubit extends Cubit<FavoritesState>  {
  final FavoritesRepository repository;
  FavoritesCubit(this.repository): super(const FavoritesState.initial()){
  }



  List<FavoriteModel> items=[];





  notify(){
    emit(const FavoritesState.notify());
  }


  void init(BuildContext context)  {

    getAllIFavorites(context);

  }


void onRefresh(BuildContext context){

  getAllIFavorites(context);
}

  Future<void> getAllIFavorites(
      BuildContext context  ) async {
    items.clear();

    emit(const FavoritesState.loading(),);

    final response = await repository.getAllIFavorites( );
    response.when(
      success: (data) async {
        List list = data.result.list;

        items.addAll(list.whereType());
        if(items.isEmpty)
          emit(FavoritesState.empty( data.message),);
         else
        emit(FavoritesState.success(items, data.message),);
      },
      failure: (networkException) {
        emit(FavoritesState.failure(networkException),);
        ResponseHelper.onNetworkFailure(context,networkException:networkException);

      },
    );
  }
  removeFavourite(BuildContext context,{required int? itemId, int? studentId,}){
    studentId??=  context.read<UserCubit>().user?.id;
    items.removeWhere((e)=>e.itemId==itemId&&studentId==studentId);
    context.read<ItemsCubit>().onRefresh(context);
    emit(const FavoritesState.notify());
  }
  addFavourite(BuildContext context,{required int? itemId, int? studentId,}){
    studentId??=  context.read<UserCubit>().user?.id;
    if(!items.any((e)=>e.itemId==itemId&&studentId==studentId))
      items.add(FavoriteModel(itemId: itemId,studentId: studentId));
    context.read<ItemsCubit>().onRefresh(context);
    emit(const FavoritesState.notify());
  }
  checkFavourite(BuildContext context,{required int? itemId, int? studentId,}){
    studentId??=  context.read<UserCubit>().user?.id;
    return (items.any((e)=>e.itemId==itemId&&studentId==studentId));

  }


  ///buildItemsPage
  bool buildItemsWhen(FavoritesState previous,FavoritesState current){
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

  Widget buildItems(BuildContext context,FavoritesState state,Widget child)=>
      state.maybeWhen(
          loading:()=>const LoadingDataView(),
          failure: (networkExceptions)=>ErrorView(networkExceptions: networkExceptions,onRetry:()=>onRefresh(context)),
          empty:(_)=>EmptyDataView(),
          orElse: () =>child
      );

}


