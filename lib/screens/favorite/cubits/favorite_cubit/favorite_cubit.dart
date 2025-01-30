import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maqsaf_app/screens/carts/data/models/item_cart_model.dart';
import 'package:maqsaf_app/screens/favorite/data/models/favorite_model.dart';
import 'package:maqsaf_app/screens/favorite/domain/repositories/favorites_repository.dart';
import 'package:maqsaf_app/screens/profile/cubits/user_cubit/user_cubit.dart';

import '../../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../../../../../core/widgets/widgets_Informative/error_view.dart';
import '../../../../../core/widgets/widgets_Informative/empty_data_view.dart';
import '../../../../../core/widgets/widgets_Informative/loading_data_view.dart';
import '../../../../core/dialogs/loading_dialog.dart';
import '../../../../core/helpers/response_helper.dart';

part 'favorite_state.dart';
part 'favorite_cubit.freezed.dart';

class FavoriteCubit extends Cubit<FavoriteState>  {
  final FavoritesRepository repository;
  FavoriteCubit(this.repository): super(const FavoriteState.initial());
  FavoriteModel? itemCart;
  // int? priceOfferId;


  void init(BuildContext context)  {
    itemCart=null;


  }


  Future<void> changeItemFavourite( BuildContext context,{int? itemId,VoidCallback? onSuccess ,required bool favorite})async {

    !favorite?await addItemForFavorite(context,itemId: itemId,onSuccess:onSuccess)
        :await deleteItemFromFavorite(context,itemId: itemId,onSuccess:onSuccess);
  }



  Future<void> addItemForFavorite(BuildContext context,
      { int? itemId,VoidCallback? onSuccess })  async {


    int? studentId=  context.read<UserCubit>().user?.id;
    LoadingDialog.show(context);
    final response = await repository.addItemForFavorite(
      itemId:itemId,
        studentId:studentId
    );
    response.when(
      success: (data) async {

        LoadingDialog.hide(context);
        ResponseHelper.onSuccess(context,message: data.message);
        onSuccess?.call();
        // onRefreshItem(context, priceOfferId: priceOfferId);
        // context.read<PriceOfferFullsCubit>().onRefresh();
      },
      failure: (networkException) {
        LoadingDialog.hide(context);
        ResponseHelper.onNetworkFailure(context,networkException: networkException);

      },
    );
  }
  Future<void> deleteItemFromFavorite(BuildContext context,
      { int? itemId,VoidCallback? onSuccess })  async {


    int? studentId=  context.read<UserCubit>().user?.id;
    LoadingDialog.show(context);
    final response = await repository.deleteItemFromFavorite(
        itemId:itemId,
        studentId:studentId
    );
    response.when(
      success: (data) async {

        LoadingDialog.hide(context);
        ResponseHelper.onSuccess(context,message: data.message);
        onSuccess?.call();
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
  bool buildItemWhen(FavoriteState previous,FavoriteState current){
    if(current==previous) return false;
    return current.maybeWhen(
        loading: () =>true ,
        success: (_,__) =>true ,
        failure: (_) =>true ,
        empty: (_) =>true,
        orElse: () =>false
    );
  }
  Widget buildItem(BuildContext context,FavoriteState state,Widget child)=>
      state.maybeWhen(

          loading:()=>LoadingDataView(),
          failure: (networkExceptions)=> ErrorView(networkExceptions:networkExceptions),
          empty:(_)=>EmptyDataView(),
          orElse: () =>child
      );

}
