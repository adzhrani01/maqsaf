part of 'payment_cart_cubit.dart';



@freezed
class PaymentCartState  with _$PaymentCartState {
  const factory PaymentCartState.initial() = _Initial;
  const factory PaymentCartState.dispose() = _Dispose;
  const factory PaymentCartState.save() = _Save;

  const factory PaymentCartState.progress() = _Progress;
  const factory PaymentCartState.loading() = _Loading;
  const factory PaymentCartState.failure(NetworkExceptions? networkException) = _Failure;
  const factory PaymentCartState.success(PaymentCartModel? data,String? message) = _Success;
  const factory PaymentCartState.empty(String? message) = _Empty;

}

