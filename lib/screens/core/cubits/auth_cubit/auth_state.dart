part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.dispose() = _Dispose;
  const factory AuthState.save() = _Save;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.updatePassword() = _UpdatePassword;
  const factory AuthState.failure(NetworkExceptions? networkException) = _Failure;
  const factory AuthState.success(String? data,String? message) = _Success;
}

