
import 'package:dio/dio.dart';

import '../../../domain/services/api_service.dart';
import '../../../utils/app_url.dart';
import '../../models/base_model.dart';
import '../../models/models.dart';

/// ## this is example for remote:
class RemoteDataSource {
  final ApiServices _apiServices;

  RemoteDataSource(this._apiServices);

  // Future<BaseModel> login(String email, String password) async {
  //   final response = await _apiServices.post(AppUrl.login,
  //       body: {
  //         "email": email,
  //         "password": password,
  //       },
  //       hasToken: false);
  //
  //   return BaseModel.fromJson(
  //     response,
  //     (json) => UserModel.fromJson(json),
  //   );
  // }
  //
  // Future<BaseModel> register(UserModel user) async {
  //   FormData formData = FormData.fromMap({
  //     "email": user.email,
  //     'password': user.password,
  //     "first_name": user.firstName,
  //     "last_name": user.lastName,
  //     "about": user.about,
  //   });
  //   final response = await _apiServices.post(AppUrl.register,
  //       formData: formData, hasToken: false);
  //
  //   return BaseModel.fromJson(
  //     response,
  //     (json) => UserModel.fromJson(json),
  //   );
  // }


  Future<BaseModel> logout() async {
    final response = await _apiServices.delete(AppUrl.logout, hasToken: true);

    return BaseModel(result: null, error:ErrorModel(message:  'done_logout'));
  }


  ///
  // Future<BaseModel> getProfile() async {
  //   final response = await _apiServices.get(AppUrl.getProfile, hasToken: true);
  //   return BaseModel.fromJson(
  //     response,
  //     (json) => UserModel.fromJson(json),
  //   );
  // }


}
