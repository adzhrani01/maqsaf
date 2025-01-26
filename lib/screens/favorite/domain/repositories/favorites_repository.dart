
import '../../../../../core/data/datasource/remote/api_response.dart';

import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../data/datasource/remote/favorites_remote_data_source.dart';

class FavoritesRepository {
  final FavoritesRemoteDataSource _remoteDataSource;

  FavoritesRepository(this._remoteDataSource) ;

  Future<ApiResponse<BaseModel>>  getAllIFavorites() async {
    try {
      final response = await _remoteDataSource.getAllIFavorites();
     return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }

  Future<ApiResponse<BaseModel>>  addItemForFavorite(
      {int? itemId,int? studentId}
      )  async {
    try {
      final response = await _remoteDataSource.addItemForFavorite(itemId,studentId);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }

}
