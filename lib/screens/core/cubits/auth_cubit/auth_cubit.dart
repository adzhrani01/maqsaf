import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maqsaf_app/core/widgets/constants_widgets.dart';
import 'package:maqsaf_app/screens/login/login_screen.dart';

import '../../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../../../../core/data/datasource/storage/app_storage.dart';

import '../../../../../core/helpers/response_helper.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../core/dialogs/loading_dialog.dart';
import '../../../../widgets/components.dart';
import '../../../login/domain/repositories/auth_repository.dart';
import '../../../profile/cubits/user_cubit/user_cubit.dart';
import '../../../select_student_screen.dart';


part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repository;
  AuthCubit(this._repository) : super(const AuthState.initial());
  Map<String,dynamic>? result;





  Future<void> _saveUser(BuildContext context) async {
    emit(const AuthState.save());
    await AppStorage.instance.writeData(AppStorage.TOKEN, result?['access']);
    await AppStorage.instance.writeData(AppStorage.REFRESH_TOKEN_EXPIRE, result?['refreshTokenExpireInSeconds']);
    await AppStorage.instance.writeData(AppStorage.REFRESH_TOKEN, result?['refresh']);
    await AppStorage.instance.writeData(AppStorage.LOGIN_TIME, DateTime.now().toIso8601String());
  }

  Future<void> disposeUser(BuildContext context) async {
    emit(const AuthState.dispose());
    await AppStorage.instance.removeData(AppStorage.TOKEN);
    await AppStorage.instance.removeData(AppStorage.LOGIN_TIME);
    await AppStorage.instance.removeData(AppStorage.REFRESH_TOKEN);
    await AppStorage.instance.removeData(AppStorage.REFRESH_TOKEN_EXPIRE);
    // context.pushReplacement(Routes.loginScreen);
    // context.pushAndRemoveUntil(Routes.loginScreen, predicate: (Route<dynamic> route) =>false);
    navigationPushAndRemoveUntil(context, const LoginScreen());
    // goRouter.pushReplacementNamed(AppRoute.splash.name);
  
  }

  Future<void> login(BuildContext context,
      {required String email, required String password}) async {
    emit(
      const AuthState.loading(),
    );

    // LoadingDialog.show(context);
    LoadingDialog.show(context);
  

    final response = await _repository.login(email, password);

    response.when(
      success: (data) async {
         result = data.result;

        emit(
          AuthState.success(result?['access'],''),
        );
        await _saveUser(context);

         // ResponseHelper.onSuccess(context,message: data.message);
         await Future.delayed(Duration(seconds: 2));

          if(await context.read<UserCubit>().getProfile(context,isSplash: false)??false)
           // context.pushReplacement(Routes.navbarScreen);
         // context.pushAndRemoveUntil(Routes.navbarScreen, predicate: (Route<dynamic> route) =>false);
         navigationPushAndRemoveUntil(context,  SelectStudentScreen());

         else
         LoadingDialog.hide(context);
          // goRouter.pushReplacementNamed(AppRoute.navbar.name);
        // Navigator.pop(context);

      },
      failure: (networkException) {

        LoadingDialog.hide(context);
        emit(AuthState.failure(networkException),);
        ResponseHelper.onFailure(context,message: NetworkExceptions.getErrorMessage(networkException));

      },
    );
  }

  Future<void> refreshToken(BuildContext context,) async {
    emit(
      const AuthState.loading(),
    );

    LoadingDialog.show(context);

    final response = await _repository.refreshToken();

    response.when(
      success: (data) async {
        result = data.result;
        emit(
          AuthState.success(result?['access'],''),
        );
        await _saveUser(context);
        ResponseHelper.onSuccess(context,message: data.message);

        LoadingDialog.hide(context);

        // goRouter.pushReplacementNamed(AppRoute.navbar.name);
        // Navigator.pop(context);

      },
      failure: (networkException) async {
        Future.delayed(Duration(seconds: 3), () async {
          LoadingDialog.hide(context);
          emit(AuthState.failure(networkException),);
          ResponseHelper.onFailure(context,message: NetworkExceptions.getErrorMessage(networkException));
          context.read<UserCubit>().user=null;
          await disposeUser(context);
        });

      },
    );
  }

  Future<void> logout(BuildContext context) async {
    emit(
      const AuthState.loading(),
    );
    LoadingDialog.show(context);

    final response = await _repository.logout();

    response.when(
      success: (data) async {
        emit(
          AuthState.success(null, data?.message),
        );
        ResponseHelper.onSuccess(context,message: data.message);

        LoadingDialog.hide(context);

        context.read<UserCubit>().user=null;
        await disposeUser(context);

      },
      failure: (networkException) async {

        LoadingDialog.hide(context);
        emit(AuthState.failure(networkException),);

        ResponseHelper.onNetworkFailure(context,networkException:networkException);
        LoadingDialog.hide(context);

      },
    );
  }

}
