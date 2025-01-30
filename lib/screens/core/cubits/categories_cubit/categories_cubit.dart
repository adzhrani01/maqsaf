
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


part 'categories_state.dart';
part 'categories_cubit.freezed.dart';

class CategoriesCubit extends Cubit<CategoriesState>  {
  final CategoriesRepository repository;
  CategoriesCubit(this.repository): super(const CategoriesState.initial()){
  }



  List<ItemModel> categories=[];





  notify(){
    emit(const CategoriesState.notify());
  }


  void init(BuildContext context)  {

    getAllCategories(context);

  }


void onRefresh(BuildContext context){

  getAllCategories(context);
}

  Future<void> getAllCategories(
      BuildContext context  ) async {
    categories.clear();

    emit(const CategoriesState.loading(),);

    final response = await repository.getAllCategories( );
    response.when(
      success: (data) async {
        List list = data.result.list;

        categories.addAll(list.whereType());
        if(categories.isEmpty)
          emit(CategoriesState.empty( data.message),);
         else
        emit(CategoriesState.success(categories, data.message),);
      },
      failure: (networkException) {
        emit(CategoriesState.failure(networkException),);
        ResponseHelper.onNetworkFailure(context,networkException:networkException);

      },
    );
  }


  ///buildCategoriesPage
  bool buildCategoriesWhen(CategoriesState previous,CategoriesState current){
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

  Widget buildItems(BuildContext context,CategoriesState state,Widget child)=>
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


