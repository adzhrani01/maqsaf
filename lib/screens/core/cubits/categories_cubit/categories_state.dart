part of 'categories_cubit.dart';

@freezed
class CategoriesState  with _$CategoriesState {
  const factory CategoriesState.initial() = _Initial;
  const factory CategoriesState.dispose() = _Dispose;
  const factory CategoriesState.save() = _Save;
  const factory CategoriesState.notify() = _Notify;
  const factory CategoriesState.changeIndex(int? index) = _ChangeIndex;


  const factory CategoriesState.loading() = _Loading;
  const factory CategoriesState.failure(NetworkExceptions? networkException) = _Failure;
  const factory CategoriesState.success(List<ItemModel>? data,String? message) = _Success;
  const factory CategoriesState.empty(String? message) = _Empty;

}

