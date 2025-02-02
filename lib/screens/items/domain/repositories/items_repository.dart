
import '../../../../../core/data/datasource/remote/api_response.dart';

import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../data/datasource/remote/items_remote_data_source.dart';

class ItemsRepository {
  final ItemsRemoteDataSource _remoteDataSource;

  ItemsRepository(this._remoteDataSource) ;

  Future<ApiResponse<BaseModel>>  getAllItems() async {
    try {
      final response = await _remoteDataSource.getAllItems();
     return ApiResponse.success(response);
    } catch (error) {
      print(error);
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }

}
