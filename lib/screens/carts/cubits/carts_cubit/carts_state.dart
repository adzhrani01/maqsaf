part of 'carts_cubit.dart';

@freezed
class CartsState  with _$CartsState {
  const factory CartsState.initial() = _Initial;
  const factory CartsState.dispose() = _Dispose;
  const factory CartsState.save() = _Save;
  const factory CartsState.notify() = _Notify;
  const factory CartsState.changeIndex(int? index) = _ChangeIndex;


  const factory CartsState.loading() = _Loading;
  const factory CartsState.failure(NetworkExceptions? networkException) = _Failure;
  const factory CartsState.success(List<CartModel>? data,String? message) = _Success;
  const factory CartsState.empty(String? message) = _Empty;

}

