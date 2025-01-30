
import '../../../../../core/data/datasource/remote/api_response.dart';

import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../data/datasource/remote/ingredients_remote_data_source.dart';

class IngredientsRepository {
  final IngredientsRemoteDataSource _remoteDataSource;

  IngredientsRepository(this._remoteDataSource) ;

  Future<ApiResponse<BaseModel>>  getAllIngredients() async {
    try {
      final response = await _remoteDataSource.getAllIngredients();
     return ApiResponse.success(response);
    } catch (error) {
      print(error);
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }

}
