part of 'deleted_foods_cubit.dart';

@freezed
class DeletedFoodsState  with _$DeletedFoodsState {
  const factory DeletedFoodsState.initial() = _Initial;
  const factory DeletedFoodsState.dispose() = _Dispose;
  const factory DeletedFoodsState.save() = _Save;
  const factory DeletedFoodsState.notify() = _Notify;
  const factory DeletedFoodsState.changeIndex(int? index) = _ChangeIndex;


  const factory DeletedFoodsState.loading() = _Loading;
  const factory DeletedFoodsState.failure(NetworkExceptions? networkException) = _Failure;
  const factory DeletedFoodsState.success(List<FoodModel>? data,String? message) = _Success;
  const factory DeletedFoodsState.empty(String? message) = _Empty;

}

