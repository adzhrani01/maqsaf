
import '../../../../../core/data/datasource/remote/api_response.dart';
import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../data/remote/auth_remote_data_source.dart';

class AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepository(this._remoteDataSource) ;

  Future<ApiResponse<BaseModel>> login(String email, String password) async {
    try {
      final response = await _remoteDataSource.login(email, password);

      return ApiResponse.success(response);
    } catch (error) {

      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }

  Future<ApiResponse<BaseModel>> refreshToken() async {
    try {
      final response = await _remoteDataSource.refreshToken();

      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }




  Future<ApiResponse<BaseModel>> resetPassword(String? email,String? code,String? newPassword) async {
    try {
      final response = await _remoteDataSource.resetPassword(email:email,code:code,newPassword:newPassword);

      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }

  Future<ApiResponse<BaseModel>> requestPasswordReset(String? email) async {
    try {
      final response = await _remoteDataSource.resetPassword(email:email);

      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }
  Future<ApiResponse<BaseModel>> resendResetPasswordCode(String? email)  async {
    try {
      final response = await _remoteDataSource.resetPassword(email:email);

      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }
  Future<ApiResponse<BaseModel>> verifyPasswordCode({String? email,String? code})async {
    try {
      final response = await _remoteDataSource.resetPassword(email:email,code:code);

      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }


  Future<ApiResponse<BaseModel>> logout({String? accountType}) async {
    try {
      final response = await _remoteDataSource.logout();
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }

  // Future<ApiResponse<BaseModel>> getProfile() async {
  //   try {
  //     final response = await _remoteDataSource.getProfile();
  //     return ApiResponse.success(response);
  //   } catch (error) {
  //     return ApiResponse.failure(
  //       NetworkExceptions.getException(error),
  //     );
  //   }
  // }

}
