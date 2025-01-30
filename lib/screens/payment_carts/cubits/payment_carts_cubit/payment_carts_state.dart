part of 'payment_carts_cubit.dart';

@freezed
class PaymentCartsState  with _$PaymentCartsState {
  const factory PaymentCartsState.initial() = _Initial;
  const factory PaymentCartsState.dispose() = _Dispose;
  const factory PaymentCartsState.save() = _Save;
  const factory PaymentCartsState.notify() = _Notify;
  const factory PaymentCartsState.changeIndex(int? index) = _ChangeIndex;


  const factory PaymentCartsState.loading() = _Loading;
  const factory PaymentCartsState.failure(NetworkExceptions? networkException) = _Failure;
  const factory PaymentCartsState.success(List<PaymentCartModel>? data,String? message) = _Success;
  const factory PaymentCartsState.empty(String? message) = _Empty;

}

