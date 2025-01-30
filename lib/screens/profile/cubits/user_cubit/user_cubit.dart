import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/domain/error_handler/network_exceptions.dart';

import '../../../../../core/helpers/response_helper.dart';

import '../../../../core/data/models/item_model.dart';
import '../../../../core/widgets/constants_widgets.dart';
import '../../../../widgets/components.dart';
import '../../../login/login_screen.dart';
import '../../../select_student_screen.dart';
import '../../data/models/user.dart';

import '../../domain/repositories/user_repository.dart';


part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _repository;
  String? photoProfileUrl;
  Uint8List? photoProfileUint8List;
  XFile? image;
  UserCubit(this._repository) : super(const UserState.initial());
  UserModel? user;
  List<UserModel> users=[];


  void updateUser(UserModel userModel){
    user=userModel;
    emit(
      const UserState.save(),
    );
  }

  Future<bool?> getProfile(
      BuildContext context,{
        bool isSplash=true
      }
      ) async {
    emit(
      const UserState.loading(),
    );
    final response = await _repository.getProfile();

    bool isGetProfile=false;
    await response.when(
      success: (data) async {
        List list = data.result.list;
        users.clear();
        users.addAll(list.whereType());


        emit(
          UserState.success(user??UserModel(), data?.message),
        );
        isGetProfile= true;

        if(isSplash)
          // context.pushAndRemoveUntil(Routes.navbarScreen, predicate: (Route<dynamic> route) =>false);
          navigationPushAndRemoveUntil(context,  SelectStudentScreen());
        // context.pushReplacement(Routes.navbarScreen);
            ;
        // goRouter.pushReplacementNamed(AppRoute.navbar.name);
      },
      failure: (networkException) async {


        emit(UserState.failure(networkException),);
        // ResponseHelper.onFailure(context,message: NetworkExceptions.getErrorMessage(networkException));
        ResponseHelper.onNetworkFailure(context,networkException:(networkException));

        if(isSplash)
          // context.pushAndRemoveUntil(Routes.loginScreen, predicate: (Route<dynamic> route) =>false);
          navigationPushAndRemoveUntil(context, const LoginScreen());
        // context.pushReplacement(Routes.loginScreen);
        // goRouter.pushReplacementNamed(AppRoute.login.name);
      },
    );
    return isGetProfile;
  }
  // Future<bool?> getProfile(
  //   BuildContext context,{
  //     bool isSplash=true
  // }
  // ) async {
  //   emit(
  //     const UserState.loading(),
  //   );
  //   final response = await _repository.getProfile();
  //   bool isGetProfile=false;
  //   await response.when(
  //     success: (data) async {
  //       user = await data.result;
  //       photoProfileUint8List=null;
  //       photoProfileUrl=null;
  //       emit(
  //         UserState.success(user!, data?.message),
  //       );
  //       isGetProfile= true;
  //       if(isSplash)
  //         // context.pushAndRemoveUntil(Routes.navbarScreen, predicate: (Route<dynamic> route) =>false);
  //       navigationPushAndRemoveUntil(context, const ());
  //         // context.pushReplacement(Routes.navbarScreen);
  //       ;
  //       // goRouter.pushReplacementNamed(AppRoute.navbar.name);
  //     },
  //     failure: (networkException) async {
  //       emit(UserState.failure(networkException),);
  //       // ResponseHelper.onFailure(context,message: NetworkExceptions.getErrorMessage(networkException));
  //       ResponseHelper.onNetworkFailure(context,networkException:(networkException));
  //       if(isSplash)
  //         // context.pushAndRemoveUntil(Routes.loginScreen, predicate: (Route<dynamic> route) =>false);
  //       navigationPushAndRemoveUntil(context, const LoginScreen());
  //       // context.pushReplacement(Routes.loginScreen);
  //       // goRouter.pushReplacementNamed(AppRoute.login.name);
  //     },
  //   );
  //   return isGetProfile;
  // }


  Future<void> updateProfile(BuildContext context,{
    required String firstName,
    required String lastName,
  }) async {
    ConstantsWidgets.showLoading();
    emit(
      const UserState.loading(),
    );

    final updatedUser = user?.copyWith(
      firstName: firstName,
      lastName: lastName,
    );

    final response = await _repository.updateProfile(user: updatedUser);
    response.when(
      success: (data) async {
        // user = await data.result;
        user = await updatedUser;
        // photoProfileUint8List=null;
        // photoProfileUrl=null;
        ResponseHelper.onSuccess(context,message: data.message);
        emit(
          UserState.success(user, data?.message),
        );
        emit(
            UserState.save()
        );
        UserState.save();
        ConstantsWidgets.closeDialog();
        Navigator.pop(context);
      },
      failure: (networkException) async {
        ConstantsWidgets.closeDialog();
        emit(UserState.failure(networkException),);
        ResponseHelper.onFailure(context,message: NetworkExceptions.getErrorMessage(networkException));
      },
    );
  }

  Future<void> updateStudents(BuildContext context,{
    bool withBack=false,
    String? dailyLimit,
    String? balance,
    List<ItemModel>? prohibitedIngredients,
  }) async {
    ConstantsWidgets.showLoading();
    emit(
      const UserState.loading(),
    );

    final updatedUser = user?.copyWith(
      dailyLimit: dailyLimit??user?.dailyLimit,
      balance: balance??user?.balance,
      prohibitedIngredients: prohibitedIngredients??user?.prohibitedIngredients,
    );

    final response = await _repository.updateStudent(
        id: user?.id,dailyLimit: dailyLimit,balance: balance,
        prohibitedIngredients: prohibitedIngredients
    );
    response.when(
      success: (data) async {
        // user = await data.result;
        user = await updatedUser;
        // photoProfileUint8List=null;
        // photoProfileUrl=null;
        ResponseHelper.onSuccess(context,message: data.message);
        emit(
          UserState.success(user, data?.message),
        );
        emit(
            UserState.save()
        );
        UserState.save();
        ConstantsWidgets.closeDialog();
        if(withBack)
          Navigator.pop(context);
      },
      failure: (networkException) async {
        ConstantsWidgets.closeDialog();
        // emit(UserState.failure(networkException),);
        ResponseHelper.onNetworkFailure(context,networkException:networkException);
      },
    );
  }

  Future<void> updateBalanceStudents(BuildContext context,{

    String? balance,

  }) async {

    emit(
      const UserState.loading(),
    );

    final updatedUser = user?.copyWith(
      dailyLimit: user?.dailyLimit,
      balance: balance??user?.balance,
      prohibitedIngredients: user?.prohibitedIngredients,
    );

    final response = await _repository.updateStudent(
        id: user?.id,balance: balance
    );
    response.when(
      success: (data) async {
        user = await updatedUser;


        emit(
          UserState.success(user, data?.message),
        );
        emit(
            UserState.save()
        );
        UserState.save();

      },
      failure: (networkException) async {

        // emit(UserState.failure(networkException),);
        // ResponseHelper.onNetworkFailure(context,networkException:networkException);
      },
    );
  }

// Future<void> uploadPictureToCache(BuildContext context,{
//   required String? path,
// }) async {
//    ConstantsWidgets.showLoading();
//
//
//   final response = await _repository.uploadPictureToCache(path: path);
//   response.when(
//     success: (data) async {
//       final fileToken = await data.result['fileToken'];
//        ConstantsWidgets.closeDialog();
//       await updateProfilePicture(context,fileToken: fileToken);
//     },
//     failure: (networkException) async {
//        ConstantsWidgets.closeDialog();
//       ResponseHelper.onFailure(context,message: NetworkExceptions.getErrorMessage(networkException));
//
//     },
//   );
// }
//
//
// Future<void> updateProfilePicture(BuildContext context,{
//   required String? fileToken,
// }) async {
//    ConstantsWidgets.showLoading();
//   emit(const UserState.upload(),);
//
//
//   final response = await _repository.updateProfilePicture(fileToken: fileToken);
//   response.when(
//     success: (data) async {
//       ResponseHelper.onSuccess(context,message: data.message);
//       emit(UserState.success(user, data?.message),);
//       photoProfileUint8List=null;
//        ConstantsWidgets.closeDialog();
//       Navigator.pop(context);
//     },
//     failure: (networkException) async {
//        ConstantsWidgets.closeDialog();
//       emit(UserState.failure(networkException),);
//       ResponseHelper.onFailure(context,message: NetworkExceptions.getErrorMessage(networkException));
//     },
//   );
// }



}
