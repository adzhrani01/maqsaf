
import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maqsaf_app/core/data/models/item_model.dart';
import 'package:maqsaf_app/screens/core/domain/repositories/categories_repository.dart';
import '../../../../../../core/data/utils/paginate_adapter.dart';
import '../../../../../../core/domain/error_handler/message.dart';
import '../../../../../../core/domain/error_handler/network_exceptions.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/widgets/shimmer/load_List.dart';
import '../../../../../core/widgets/shimmer/load_circle_List.dart';
import '../../../../core/helpers/response_helper.dart';
import '../../domain/repositories/ingredients_repository.dart';


part 'ingredients_state.dart';
part 'ingredients_cubit.freezed.dart';

class IngredientsCubit extends Cubit<IngredientsState>  {
  final IngredientsRepository repository;
  IngredientsCubit(this.repository): super(const IngredientsState.initial()){
  }



  List<ItemModel> ingredients=[];





  notify(){
    emit(const IngredientsState.notify());
  }


  void init(BuildContext context)  {

    getAllIngredients(context);

  }


void onRefresh(BuildContext context){

  getAllIngredients(context);
}

  Future<void> getAllIngredients(
      BuildContext context  ) async {
    ingredients.clear();

    emit(const IngredientsState.loading(),);

    final response = await repository.getAllIngredients( );
    response.when(
      success: (data) async {
        List list = data.result.list;

        ingredients.addAll(list.whereType());
        if(ingredients.isEmpty)
          emit(IngredientsState.empty( data.message),);
         else
        emit(IngredientsState.success(ingredients, data.message),);
      },
      failure: (networkException) {
        emit(IngredientsState.failure(networkException),);
        ResponseHelper.onNetworkFailure(context,networkException:networkException);

      },
    );
  }


  ///buildCategoriesPage
  bool buildCategoriesWhen(IngredientsState previous,IngredientsState current){
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

  Widget buildItems(BuildContext context,IngredientsState state,Widget child)=>
      state.maybeWhen(
          loading:()=>const LoadCircleList(itemCount:5),
          failure: (networkExceptions)=>getWidgetView(context,NetworkExceptions.getErrorMessage(networkExceptions)),
          // empty:(_)=>getWidgetView('لا يوجد أنواع'),
          orElse: () =>child
      );
  Widget getWidgetView(BuildContext context,String message){
    return  Center(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 8.w, vertical: 8.h),
        // width: 50.w,
        // height: 50.h,
        decoration: BoxDecoration(
          color: ColorManager.companyFilterRectangleColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(child:Icon(Icons.refresh),
              onTap:()=>onRefresh(context),
            ),
            SizedBox(width: 10.w,),
            Text(
                '${message} !'
            ),
          ],
        ),
      ),
    );
  }

}


