part of 'change_password_cubit.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState.initial() = _Initial;
  const factory ChangePasswordState.dispose() = _Dispose;
  const factory ChangePasswordState.save() = _Save;
  const factory ChangePasswordState.loading() = _Loading;
  const factory ChangePasswordState.updatePassword() = _UpdatePassword;
  const factory ChangePasswordState.failure(NetworkExceptions? networkException) = _Failure;
  const factory ChangePasswordState.success(String? data,String? message) = _Success;
}

