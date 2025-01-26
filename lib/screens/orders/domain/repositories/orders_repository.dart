
import '../../../../../core/data/datasource/remote/api_response.dart';

import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../data/datasource/remote/orders_remote_data_source.dart';

class OrdersRepository {
  final OrdersRemoteDataSource _remoteDataSource;

  OrdersRepository(this._remoteDataSource) ;

  Future<ApiResponse<BaseModel>>  getAllOrders() async {
    try {
      final response = await _remoteDataSource.getAllOrders();
     return ApiResponse.success(response);
    } catch (error) {

      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }
  Future<ApiResponse<BaseModel>>  createOrder(
  {int? itemId,int? studentId}
      )  async {
    try {
      final response = await _remoteDataSource.createOrder(itemId,studentId);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }


}
