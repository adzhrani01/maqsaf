
import '../../../../../core/data/datasource/remote/api_response.dart';
import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/error_handler/network_exceptions.dart';

import '../../../../core/data/models/item_model.dart';
import '../../data/models/user.dart';
import '../../data/remote/user_remote_data_source.dart';

class UserRepository {
  final UserRemoteDataSource _remoteDataSource;

  UserRepository(this._remoteDataSource) ;


  Future<ApiResponse<BaseModel>> getProfile() async {
    try {
      final response = await _remoteDataSource.getProfile();
      return ApiResponse.success(response);
    } catch (error) {

      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }

  Future<ApiResponse<BaseModel>> updateProfile({required UserModel? user})  async {
    try {
      final response = await _remoteDataSource.updateProfile(user: user);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }
  Future<ApiResponse<BaseModel>>  updateStudent({required int? id, String? dailyLimit,
    String? balance,
    List<ItemModel>? prohibitedIngredients,})  async {
    try {
      final response = await _remoteDataSource.updateStudent(id: id,dailyLimit: dailyLimit,balance: balance,
      prohibitedIngredients: prohibitedIngredients);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }

  // Future<ApiResponse<BaseModel>> getProfilePicture() async {
  //   try {
  //     final response = await _remoteDataSource.getProfilePicture();
  //     return ApiResponse.success(response);
  //   } catch (error) {
  //     return ApiResponse.failure(
  //       NetworkExceptions.getException(error),
  //     );
  //   }
  // }
  // Future<ApiResponse<BaseModel>> uploadPictureToCache({required String? path}) async {
  //   try {
  //     final response = await _remoteDataSource.uploadPictureToCache(path: path);
  //     return ApiResponse.success(response);
  //   } catch (error) {
  //     return ApiResponse.failure(
  //       NetworkExceptions.getException(error),
  //     );
  //   }
  // }
  // Future<ApiResponse<BaseModel>>  updateProfilePicture({required String? fileToken}) async {
  //   try {
  //     final response = await _remoteDataSource.updateProfilePicture(fileToken: fileToken);
  //     return ApiResponse.success(response);
  //   } catch (error) {
  //     return ApiResponse.failure(
  //       NetworkExceptions.getException(error),
  //     );
  //   }
  // }
}
