part of 'orders_cubit.dart';

@freezed
class OrdersState  with _$OrdersState{
  const factory OrdersState.initial() = _Initial;
  const factory OrdersState.dispose() = _Dispose;
  const factory OrdersState.save() = _Save;
  const factory OrdersState.notify() = _Notify;
  const factory OrdersState.changeIndex(int? index) = _ChangeIndex;


  const factory OrdersState.loading() = _Loading;
  const factory OrdersState.failure(NetworkExceptions? networkException) = _Failure;
  const factory OrdersState.success(List<OrderModel>? data,String? message) = _Success;
  const factory OrdersState.empty(String? message) = _Empty;

}

