part of 'item_cart_cubit.dart';



@freezed
class ItemCartState  with _$ItemCartState{
  const factory ItemCartState.initial() = _Initial;
  const factory ItemCartState.dispose() = _Dispose;
  const factory ItemCartState.save() = _Save;

  const factory ItemCartState.progress() = _Progress;
  const factory ItemCartState.loading() = _Loading;
  const factory ItemCartState.failure(NetworkExceptions? networkException) = _Failure;
  const factory ItemCartState.success(ItemCartModel? data,String? message) = _Success;
  const factory ItemCartState.empty(String? message) = _Empty;

}

