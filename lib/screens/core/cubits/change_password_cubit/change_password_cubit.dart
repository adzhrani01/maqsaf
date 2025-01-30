import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/domain/error_handler/network_exceptions.dart';

import '../../../../../core/helpers/response_helper.dart';

import '../../../../../core/widgets/widgets_Informative/error_view.dart';
import '../../../../core/widgets/constants_widgets.dart';
import '../../../login/domain/repositories/auth_repository.dart';


part 'change_password_state.dart';
part 'change_password_cubit.freezed.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final AuthRepository _repository;
  ChangePasswordCubit(this._repository) : super(const ChangePasswordState.initial());
  Map<String,dynamic>? result;

  DateTime? time;
  bool withRestPassword=false;


  Future<void> resetPassword(BuildContext context,
      {String? email,String? code,String? newPassword}) async {
    // emit(const ChangePasswordState.loading(),);

     ConstantsWidgets.showLoading();

    final response = await _repository.resetPassword(email,code, newPassword);
    response.when(
      success: (data) async {
        result = data.result;
        ResponseHelper.onSuccess(context,message: data.message);
         ConstantsWidgets.closeDialog();
        Navigator.of(context, rootNavigator: true).pop(true);
        await Future.delayed(Duration(seconds: 2));
      },
      failure: (networkException) {
         ConstantsWidgets.closeDialog();
        ResponseHelper.onFailure(context,message: NetworkExceptions.getErrorMessage(networkException));

      },
    );
  }

  Future<void> requestPasswordReset(BuildContext context,
      {String? email}) async {
    // emit(const ChangePasswordState.loading(),);

    ConstantsWidgets.showLoading();

    final response = await _repository.requestPasswordReset(email);
    response.when(
      success: (data) async {
        result = data.result;
        ResponseHelper.onSuccess(context,message: data.message);
        ConstantsWidgets.closeDialog();
        Navigator.of(context, rootNavigator: true).pop(true);
        await Future.delayed(Duration(seconds: 2));
      },
      failure: (networkException) {
        ConstantsWidgets.closeDialog();
        ResponseHelper.onFailure(context,message: NetworkExceptions.getErrorMessage(networkException));

      },
    );
  }
  Future<void> resendResetPasswordCode(BuildContext context,
      {String? email}) async {
    // emit(const ChangePasswordState.loading(),);

    ConstantsWidgets.showLoading();

    final response = await _repository.resendResetPasswordCode(email);
    response.when(
      success: (data) async {
        result = data.result;
        ResponseHelper.onSuccess(context,message: data.message);
        ConstantsWidgets.closeDialog();
        Navigator.of(context, rootNavigator: true).pop(true);
        await Future.delayed(Duration(seconds: 2));
      },
      failure: (networkException) {
        ConstantsWidgets.closeDialog();
        ResponseHelper.onFailure(context,message: NetworkExceptions.getErrorMessage(networkException));

      },
    );
  }
  Future<void> verifyPasswordCode(BuildContext context,
      {String? email,String? code}) async {
    // emit(const ChangePasswordState.loading(),);

    ConstantsWidgets.showLoading();

    final response = await _repository.verifyPasswordCode(email:email,code:code);
    response.when(
      success: (data) async {
        result = data.result;
        ResponseHelper.onSuccess(context,message: data.message);
        ConstantsWidgets.closeDialog();
        Navigator.of(context, rootNavigator: true).pop(true);
        await Future.delayed(Duration(seconds: 2));
      },
      failure: (networkException) {
        ConstantsWidgets.closeDialog();
        ResponseHelper.onFailure(context,message: NetworkExceptions.getErrorMessage(networkException));

      },
    );
  }

//   Future<void> changePassword(BuildContext context,
//     {required String newPassword,  String? currentPassword}) async {
//   // emit(const ChangePasswordState.loading(),);
//
//    ConstantsWidgets.showLoading();
//
//   final response =
//   // withRestPassword?
//   await _repository.changePassword(c: result?['c'],currentPassword:currentPassword,newPassword: newPassword);
//   // : await _repository.resetPassword(c, newPassword);
//
//   response.when(
//     success: (data) async {
//        result = data.result;
//       // emit(ChangePasswordState.success(result?['accessToken'],''),);
//       // await _saveUser(context);
//        ResponseHelper.onSuccess(context,message: data.message);
//        await Future.delayed(Duration(seconds: 2));
//        // if(withRestPassword&&(await context.read<UserCubit>().getProfile(context,isSplash: false)??false))
//        // context.pushAndRemoveUntil(Routes.navbarScreen, predicate: (Route<dynamic> route) =>false);
//        // else{
//           ConstantsWidgets.closeDialog();
//           ConstantsWidgets.closeDialog();
//        // }
//
//
//     },
//     failure: (networkException) {
//        ConstantsWidgets.closeDialog();
//       // emit(ChangePasswordState.failure(networkException),);
//       ResponseHelper.onFailure(context,message: NetworkExceptions.getErrorMessage(networkException));
//
//     },
//   );
// }



  ///buildChangePassword
  bool buildChangePasswordWhen(ChangePasswordState previous,ChangePasswordState current){
    if(current==previous) return false;
    return current.maybeWhen(
        loading: () =>true ,
        success: (_,__) =>true ,
        failure: (_) =>true ,
        updatePassword: () =>true ,
        orElse: () =>false
    );
  }

}
