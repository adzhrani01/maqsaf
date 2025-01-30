

import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../../core/data/models/base_model.dart';
import '../../../../../../core/domain/services/api_service.dart';
import '../../../../../../core/utils/app_url.dart';
import '../../../../../core/domain/services/api_services_imp.dart';
import '../../../../core/data/models/item_model.dart';
import '../../../profile/data/models/user.dart';
import '../models/user.dart';


class UserRemoteDataSource  {
  final ApiServices _apiServices;

  UserRemoteDataSource(this._apiServices);

  // Future<BaseModel> getProfile() async {
  //   final response = await _apiServices.get(AppUrl.getProfile, hasToken: true);
  //   return BaseModel.fromJson(
  //     response,
  //         (json) => UserModel.fromJson(json),
  //   );
  // }

  Future<BaseModel> getProfile() async {
    final response = await _apiServices.get(AppUrl.getProfile, hasToken: true);

    return
      BaseModel.fromJson(
        // {"result":[
        //   {
        //
        //   "id":1,
        //   "first_name":"Ahmad",
        //   "last_name":"Mriwed",
        //   "image":"https://th.bing.com/th/id/OIP.5F3SyVGz57QTefASUtBtpgHaHa?rs=1&pid=ImgDetMain",
        //   "daily_limit":"10",
        //   "balance":"100",
        //   "prohibited_ingredients":[1,2,3],
        //   "prohibited_categories":[1,2,3],
        //   }
        // ]},
        {"result":response},
            (json) => BaseModels.fromJson(json,UserModel.fromJson),
      );
  }

  Future<BaseModel> updateProfile({required UserModel? user}) async {
    var data=user?.toJson()??{};
    final response = await _apiServices.put(AppUrl.updateCurrentUserProfile, hasToken: true,
    body: data);
    response['message']='update_profile_successful';
    return BaseModel.fromJson(
      response,
          (json) => UserModel.fromJson(json),
    );
  }
  Future<BaseModel> updateStudent({required int? id, String? dailyLimit,
    String? balance,
    List<ItemModel>? prohibitedIngredients,}) async {
    Map<String,dynamic> data={
      "id":id,
    };
    if(dailyLimit!=null)
      data["daily_limit"]=dailyLimit;
    if(balance!=null)
      data["balance"]=balance;
    if(prohibitedIngredients!=null)
      data["prohibited_ingredients"]=prohibitedIngredients.map((e)=>e.id).toList()??[];
      // data["prohibited_ingredients"]=prohibitedIngredients?.map((e)=>e.toJson())?.toList()??[];

    FormData formData=FormData.fromMap(data);
    final response = await _apiServices.put(AppUrl.updateCurrentUserProfile, hasToken: true,
        formData: formData);
    response['message']='update_profile_successful';
    return BaseModel.fromJson(
      response,
          (json) => UserModel.fromJson(json),
    );
  }


  // Future<BaseModel> uploadPictureToCache({required String? path}) async {
  //   FormData formData =FormData();
  //   formData.files.add(
  //     MapEntry("FormFile", await MultipartFile.fromFile(path??'',contentType:DioMediaType.parse('image/${path?.split('.').lastOrNull}'))),
  //
  //     // MapEntry("FormFile", await MultipartFile.fromBytes((await File(path!).readAsBytes()))),
  //   );
  //
  //
  //
  //
  //   // ApiServices api=ApiServicesImp(Dio())
  //   final response = await _apiServices.post(AppUrl.uploadPictureToCache, hasToken: true,
  //       formData: formData);
  //   response['message']='upload_picture_successful';
  //   return BaseModel.fromJson(
  //     response,
  //         (json) => (json),
  //   );
  // }

  // Future<BaseModel> updateProfilePicture({required String? fileToken}) async {
  //  var data={'fileToken':fileToken};
  //
  //   final response = await _apiServices.put(AppUrl.updateProfilePicture, hasToken: true,
  //       body: data);
  //   response['message']='update_picture_successful';
  //   return BaseModel.fromJson(
  //     response,
  //         (json) => (json),
  //   );
  // }
  //
  // Future<BaseModel> getProfilePicture() async {
  //   final response = await _apiServices.get(AppUrl.getProfilePicture, hasToken: true);
  //   return BaseModel.fromJson(
  //     response,
  //         (json) => base64Decode(json['profilePicture']),
  //   );
  // }
}
