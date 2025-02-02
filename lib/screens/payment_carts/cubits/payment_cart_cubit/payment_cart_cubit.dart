import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maqsaf_app/core/dialogs/logout_dialog.dart';
import 'package:maqsaf_app/core/helpers/extensions.dart';
import 'package:maqsaf_app/screens/carts/data/models/item_cart_model.dart';
import 'package:maqsaf_app/screens/favorite/data/models/favorite_model.dart';
import 'package:maqsaf_app/screens/favorite/domain/repositories/favorites_repository.dart';
import 'package:maqsaf_app/screens/payment_carts/cubits/payment_carts_cubit/payment_carts_cubit.dart';
import 'package:maqsaf_app/screens/payment_carts/data/models/payment_cart_model.dart';
import 'package:maqsaf_app/screens/profile/cubits/user_cubit/user_cubit.dart';

import '../../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../../../../../core/widgets/widgets_Informative/error_view.dart';
import '../../../../../core/widgets/widgets_Informative/empty_data_view.dart';
import '../../../../../core/widgets/widgets_Informative/loading_data_view.dart';
import '../../../../core/dialogs/loading_dialog.dart';
import '../../../../core/helpers/response_helper.dart';
import '../../domain/repositories/payment_carts_repository.dart';

part 'payment_cart_state.dart';
part 'payment_cart_cubit.freezed.dart';

class PaymentCartCubit extends Cubit<PaymentCartState>  {
  final PaymentCartsRepository repository;
  PaymentCartCubit(this.repository): super(const PaymentCartState.initial());
  PaymentCartModel? item;


  void init(BuildContext context)  {
    item=null;


  }





  Future<void> createPaymentCart(BuildContext context,
      { PaymentCartModel? paymentCart })  async {


    int? studentId=  context.read<UserCubit>().user?.id;
    LoadingDialog.show(context);
    final response = await repository.createPaymentCart(
        paymentCart:paymentCart
    );
    response.when(
      success: (data) async {

        LoadingDialog.hide(context);
        ResponseHelper.onSuccess(context,message: data.message);
        context.read<PaymentCartsCubit>().onRefresh(context);
        context.pop();

      },
      failure: (networkException) {
        LoadingDialog.hide(context);
        ResponseHelper.onNetworkFailure(context,networkException: networkException);

      },
    );
  }
  Future<void> setDefault(BuildContext context, { int? paymentCartId,VoidCallback? onSuccess })  async {

    LoadingDialog.show(context);
    final response = await repository.setDefault(
        paymentCartId:paymentCartId
    );
    response.when(
      success: (data) async {

        LoadingDialog.hide(context);
        ResponseHelper.onSuccess(context,message: data.message);
        onSuccess?.call();

      },
      failure: (networkException) {
        LoadingDialog.hide(context);
        ResponseHelper.onNetworkFailure(context,networkException: networkException);

      },
    );
  }




  ///buildSubmitCoursePage
  bool buildItemWhen(PaymentCartState previous,PaymentCartState current){
    if(current==previous) return false;
    return current.maybeWhen(
        loading: () =>true ,
        success: (_,__) =>true ,
        failure: (_) =>true ,
        empty: (_) =>true,
        orElse: () =>false
    );
  }
  Widget buildItem(BuildContext context,PaymentCartState state,Widget child)=>
      state.maybeWhen(

          loading:()=>LoadingDataView(),
          failure: (networkExceptions)=> ErrorView(networkExceptions:networkExceptions),
          empty:(_)=>EmptyDataView(),
          orElse: () =>child
      );

}
