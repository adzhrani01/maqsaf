part of 'order_cubit.dart';



@freezed
class OrderState  with _$OrderState {
  const factory OrderState.initial() = _Initial;
  const factory OrderState.dispose() = _Dispose;
  const factory OrderState.save() = _Save;

  const factory OrderState.progress() = _Progress;
  const factory OrderState.loading() = _Loading;
  const factory OrderState.failure(NetworkExceptions? networkException) = _Failure;
  const factory OrderState.success(ItemCartModel? data,String? message) = _Success;
  const factory OrderState.empty(String? message) = _Empty;

}

