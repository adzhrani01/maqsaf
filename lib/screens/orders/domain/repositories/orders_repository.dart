
import '../../../../../core/data/datasource/remote/api_response.dart';

import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../../carts/data/models/item_cart_model.dart';
import '../../../payment_carts/data/models/payment_cart_model.dart';
import '../../data/datasource/remote/orders_remote_data_source.dart';

class OrdersRepository {
  final OrdersRemoteDataSource _remoteDataSource;

  OrdersRepository(this._remoteDataSource) ;

  Future<ApiResponse<BaseModel>>  getAllOrders({int? studentId}) async {
    try {
      final response = await _remoteDataSource.getAllOrders(studentId);
     return ApiResponse.success(response);
    } catch (error) {

      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }
  Future<ApiResponse<BaseModel>>  createOrder(
  {List<ItemCartModel>? items,String? totalPrice,int? studentId,int? paymentType,PaymentCartModel? paymentCart}
      )  async {
    try {
      final response = await _remoteDataSource.createOrder(items,totalPrice,studentId,paymentType,paymentCart);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }


}
