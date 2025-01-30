


import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../../../core/data/models/base_model.dart';
import '../../../../../../core/domain/services/api_service.dart';
import '../../../../../../core/utils/app_url.dart';
import '../../../../../core/data/datasource/storage/app_storage.dart';


class AuthRemoteDataSource  {
  final ApiServices _apiServices;

  AuthRemoteDataSource(this._apiServices);

  Future<BaseModel> login(String email, String password) async {

    final response = await _apiServices.post(
        AppUrl.login,
        body: {
          "email": email,
          "password": password,
          "firebase_token": await FirebaseMessaging.instance.getToken(),
        },
        hasToken: false);

    response['message']??='login_successful';
    return BaseModel.fromJson(
      response,
          (json) => json as Map<String,dynamic>,
    );
  }

  Future<BaseModel> refreshToken() async {
    String? refreshToken= AppStorage.instance.readData(AppStorage.REFRESH_TOKEN);
    var body={"refresh":refreshToken};
    final response = await _apiServices.post(
        AppUrl.refreshToken,
        body: body,
        hasToken: false);

    response['message']??='refresh_token_successful';
    return BaseModel.fromJson(
      response,
          (json) => json as Map<String,dynamic>,
    );
  }
  Future<BaseModel> requestPasswordReset(String? email) async {
    Map<String, dynamic>? body={
      "email":email,
    };

    final response = await _apiServices.post(
        AppUrl.requestPasswordReset,
        body:body
    );

    response['message']='get_request_reset_password_successful';
    return BaseModel.fromJson(
      response,
          (json) => json as Map<String,dynamic>,
    );
  }

  Future<BaseModel> resendResetPasswordCode(String? email) async {
    Map<String, dynamic>? body={
      "email":email,
    };

    final response = await _apiServices.post(
        AppUrl.resendRequestPasswordReset,
        body:body
        );

    response['message']='get_reset_password_info_successful';
    return BaseModel.fromJson(
      response,
          (json) => json as Map<String,dynamic>,
    );
  }

  Future<BaseModel> resetPassword({String? email,String? code,String? newPassword}) async {
    Map<String, dynamic>? body={};

    body={
      "email":email,
      "code":code,
      "new_password":newPassword,
      "new_password2":newPassword,
    };
    final response = await _apiServices.post(
        AppUrl.resetPassword,
        body: body,
        hasToken: true
    );

    response['message']='reset_password_successful';
    return BaseModel.fromJson(
      response,
          (json) => json as Map<String,dynamic>,
    );
  }
  Future<BaseModel> verifyPasswordCode({String? email,String? code}) async {
    Map<String, dynamic>? body={};

    body={
      "email":email,
      "code":code,

    };
    final response = await _apiServices.post(
        AppUrl.verifyPasswordCode,
        body: body,
        hasToken: true
    );

    response['message']='verify_password_successful';
    return BaseModel.fromJson(
      response,
          (json) => json as Map<String,dynamic>,
    );
  }


  Future<BaseModel> logout() async {
    String? refreshToken= AppStorage.instance.readData(AppStorage.REFRESH_TOKEN);
    var body={"refresh":refreshToken};
    final response = await _apiServices.post(AppUrl.logout,body:body, hasToken: true);

    return BaseModel(result: null, message: 'done_logout' );
  }


//
// Future<BaseModel> changePassword({String? c,String? currentPassword,String? newPassword}) async {
//   Map<String, dynamic>? body={};
//
//   if(c?.isNotEmpty??false)
//     body['c']=c;
//   if(currentPassword?.isNotEmpty??false){
//     body['currentPassword']=currentPassword;
//     body['newPassword']=newPassword;
//
//   }else{
//     body['password']=newPassword;
//   }
//   final response = await _apiServices.post(
//       AppUrl.changePassword,
//       body: body,
//       hasToken: true
//   );
//
//   response['message']='change_password_successful';
//   return BaseModel.fromJson(
//     response,
//         (json) => json as Map<String,dynamic>,
//   );
// }
//


// Future<BaseModel> getProfile() async {
  //   final response = await _apiServices.get(AppUrl.getProfile, hasToken: true);
  //   return BaseModel.fromJson(
  //     response,
  //         (json) => UserModel.fromJson(json),
  //   );
  // }
}
