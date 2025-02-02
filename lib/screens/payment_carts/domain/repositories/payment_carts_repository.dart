
import '../../../../../core/data/datasource/remote/api_response.dart';

import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../data/datasource/remote/payment_carts_remote_data_source.dart';
import '../../data/models/payment_cart_model.dart';

class PaymentCartsRepository {
  final PaymentCartsRemoteDataSource _remoteDataSource;

  PaymentCartsRepository(this._remoteDataSource) ;

  Future<ApiResponse<BaseModel>>  getAllPaymentCarts() async {
    try {
      final response = await _remoteDataSource.getAllPaymentCarts();
     return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }

  Future<ApiResponse<BaseModel>>  createPaymentCart(
      { PaymentCartModel? paymentCart
      }
      )  async {
    try {
      final response = await _remoteDataSource.createPaymentCart(paymentCart);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }

  Future<ApiResponse<BaseModel>>  setDefault(
      { int? paymentCartId
      }
      )  async {
    try {
      final response = await _remoteDataSource.setDefault(paymentCartId);
      return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }

}
