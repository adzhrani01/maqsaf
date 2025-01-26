part of 'favorites_cubit.dart';

@freezed
class FavoritesState  with _$FavoritesState {
  const factory FavoritesState.initial() = _Initial;
  const factory FavoritesState.dispose() = _Dispose;
  const factory FavoritesState.save() = _Save;
  const factory FavoritesState.notify() = _Notify;
  const factory FavoritesState.changeIndex(int? index) = _ChangeIndex;


  const factory FavoritesState.loading() = _Loading;
  const factory FavoritesState.failure(NetworkExceptions? networkException) = _Failure;
  const factory FavoritesState.success(List<FavoriteModel>? data,String? message) = _Success;
  const factory FavoritesState.empty(String? message) = _Empty;

}

