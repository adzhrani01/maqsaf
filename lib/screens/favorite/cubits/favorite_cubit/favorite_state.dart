part of 'favorite_cubit.dart';



@freezed
class FavoriteState  with _$FavoriteState {
  const factory FavoriteState.initial() = _Initial;
  const factory FavoriteState.dispose() = _Dispose;
  const factory FavoriteState.save() = _Save;

  const factory FavoriteState.progress() = _Progress;
  const factory FavoriteState.loading() = _Loading;
  const factory FavoriteState.failure(NetworkExceptions? networkException) = _Failure;
  const factory FavoriteState.success(FavoriteModel? data,String? message) = _Success;
  const factory FavoriteState.empty(String? message) = _Empty;

}

