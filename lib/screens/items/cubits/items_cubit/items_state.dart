part of 'items_cubit.dart';

@freezed
class ItemsState  with _$ItemsState {
  const factory ItemsState.initial() = _Initial;
  const factory ItemsState.dispose() = _Dispose;
  const factory ItemsState.save() = _Save;
  const factory ItemsState.notify() = _Notify;
  const factory ItemsState.changeIndex(int? index) = _ChangeIndex;


  const factory ItemsState.loading() = _Loading;
  const factory ItemsState.failure(NetworkExceptions? networkException) = _Failure;
  const factory ItemsState.success(List<FoodModel>? data,String? message) = _Success;
  const factory ItemsState.empty(String? message) = _Empty;

}

