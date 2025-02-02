part of 'ingredients_cubit.dart';

@freezed
class IngredientsState  with _$IngredientsState{
  const factory IngredientsState.initial() = _Initial;
  const factory IngredientsState.dispose() = _Dispose;
  const factory IngredientsState.save() = _Save;
  const factory IngredientsState.notify() = _Notify;
  const factory IngredientsState.changeIndex(int? index) = _ChangeIndex;


  const factory IngredientsState.loading() = _Loading;
  const factory IngredientsState.failure(NetworkExceptions? networkException) = _Failure;
  const factory IngredientsState.success(List<ItemModel>? data,String? message) = _Success;
  const factory IngredientsState.empty(String? message) = _Empty;

}

