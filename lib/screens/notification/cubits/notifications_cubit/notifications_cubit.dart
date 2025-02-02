
import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/data/utils/paginate_adapter.dart';
import '../../../../../../core/domain/error_handler/message.dart';
import '../../../../../../core/domain/error_handler/network_exceptions.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/shimmer/load_List.dart';
import '../../../../../core/widgets/widgets_Informative/empty_data_view.dart';
import '../../../../../core/widgets/widgets_Informative/error_view.dart';
import '../../../../../core/widgets/widgets_Informative/loading_data_view.dart';
import '../../../../core/helpers/response_helper.dart';
import '../../data/models/notification_model.dart';
import '../../domain/repositories/notification_repository.dart';

part 'notifications_state.dart';
part 'notifications_cubit.freezed.dart';

class NotificationsCubit extends Cubit<NotificationsState>  {
  final NotificationRepository repository;
  NotificationsCubit(this.repository): super(const NotificationsState.initial()){
  }


  List<NotificationModel> allNotifications=[];





  notify(){
    emit(const NotificationsState.notify());
  }


  void init(BuildContext context)  {

     allNotifications.clear();

     getNotifications(context);
  }


void onRefresh(BuildContext context){

  getNotifications(context);
}

  Future<void> getNotifications(
      BuildContext context,) async{
    getNotificationsByFilter(context);
  }


  Future<void> getNotificationsByFilter(
      BuildContext context
      ) async {

    allNotifications.clear();
    emit(const NotificationsState.loadingPagination(),);

    final response = await repository.getAllNotifications( );
    response.when(
      success: (data) async {
        List list = data.result.list;

        allNotifications.addAll(list.whereType());

        if(allNotifications.isEmpty)
          emit(NotificationsState.emptyPagination( data.message),);
         else
        emit(NotificationsState.successPagination(allNotifications, data.message),);
      },
      failure: (networkException) {
        emit(NotificationsState.failurePagination(networkException),);
        ResponseHelper.onNetworkFailure(context,networkException:networkException);

      },
    );
  }


  ///buildCoursesPage
  bool buildNotificationsWhen(NotificationsState previous,NotificationsState current){
    if(current==previous) return false;
    return current.maybeWhen(
        loadingPagination: () =>true ,
        successPagination: (_,__) =>true ,
        emptyPagination: (_) =>true ,
        failurePagination: (_) =>true ,
        notify: () =>true ,
        changeIndex: (_) =>true ,
        orElse: () =>false
    );
  }

  Widget buildNotifications(BuildContext context,NotificationsState state,Widget child)=>
      state.maybeWhen(
          loadingPagination:()=>const LoadingDataView(),
          failurePagination: (networkExceptions)=> ErrorView(networkExceptions:networkExceptions,onRetry: ()=>onRefresh(context),),
          emptyPagination:(_)=>EmptyDataView(),
          orElse: () =>child
      );



  // Widget buildNotifications(
  //     BuildContext context,{
  //         required PagingAdapter<NotificationModel> pagingAdapter,
  //         required Widget Function(BuildContext, NotificationModel, int) itemBuilder})=>
  //     pagingAdapter.buildListView(context,
  //         pagingAdapter.pagingController,
  //         (_, item, index)=>
  //         Column(
  //           children: [
  //             if (index == 0) verticalSpace(20.h),
  //             itemBuilder(context, item, index),
  //             // if (index < pagingController.itemList!.length - 1) verticalSpace(20.h),
  //              verticalSpace(20.h),
  //           ],
  //         )
  //        ,
  //       loadBuilder: LoadList()
  //     );
}


