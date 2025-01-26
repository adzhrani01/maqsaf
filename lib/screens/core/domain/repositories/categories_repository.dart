
import '../../../../../core/data/datasource/remote/api_response.dart';

import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../data/datasource/remote/categories_remote_data_source.dart';

class CategoriesRepository {
  final CategoriesRemoteDataSource _remoteDataSource;

  CategoriesRepository(this._remoteDataSource) ;

  Future<ApiResponse<BaseModel>>  getAllCategories() async {
    try {
      final response = await _remoteDataSource.getAllCategories();
     return ApiResponse.success(response);
    } catch (error) {
      print(error);
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }

}
