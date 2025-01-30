part of 'notifications_cubit.dart';

@freezed
class NotificationsState  with _$NotificationsState {
  const factory NotificationsState.initial() = _Initial;
  const factory NotificationsState.dispose() = _Dispose;
  const factory NotificationsState.save() = _Save;
  const factory NotificationsState.notify() = _Notify;
  const factory NotificationsState.changeIndex(int? index) = _ChangeIndex;


  const factory NotificationsState.loadingPagination() = _LoadingPagination;
  const factory NotificationsState.failurePagination(NetworkExceptions? networkException) = _FailurePagination;
  const factory NotificationsState.successPagination(List<NotificationModel>? data,String? message) = _SuccessPagination;
  const factory NotificationsState.emptyPagination(String? message) = _EmptyPagination;

}

