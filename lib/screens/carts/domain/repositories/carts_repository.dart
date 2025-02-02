
import '../../../../../core/data/datasource/remote/api_response.dart';

import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../data/datasource/remote/carts_remote_data_source.dart';

class CartsRepository {
  final CartsRemoteDataSource _remoteDataSource;

  CartsRepository(this._remoteDataSource) ;

  Future<ApiResponse<BaseModel>>  getAllCarts() async {
    try {
      final response = await _remoteDataSource.getAllCarts();
     return ApiResponse.success(response);
    } catch (error) {

      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }
  Future<ApiResponse<BaseModel>>  createItemCarts(
  {int? itemId,int? studentId}
      )  async {
    try {
      final response = await _remoteDataSource.createItemCarts(itemId,studentId);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }


}
