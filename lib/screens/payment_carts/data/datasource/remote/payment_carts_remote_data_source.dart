
import 'package:intl/intl.dart';
import 'package:maqsaf_app/core/data/models/item_model.dart';

import '../../../../../../core/data/models/base_model.dart';
import '../../../../../../core/domain/services/api_service.dart';
import '../../../../../../core/utils/app_url.dart';
import '../../models/payment_cart_model.dart';

class PaymentCartsRemoteDataSource  {
  final ApiServices _apiServices;

  PaymentCartsRemoteDataSource(this._apiServices);
  


  Future<BaseModel> getAllPaymentCarts() async {

    Map<String, String> queryParams={};


    final response = await _apiServices.get(AppUrl.getAllPaymentCarts,
        queryParams: queryParams,
        // body: data,
        hasToken: true);

    return BaseModel.fromJson(
      {"result":response},
          (json) => BaseModels.fromJson(json,PaymentCartModel.fromJson),
    );
  }

  Future<BaseModel> createPaymentCart(
      PaymentCartModel? paymentCart
      ) async {
    var data=paymentCart?.toJson()??{};
    // data["expire_date"]="2027-02-02";
    data["expire_date"]=DateFormat("yyyy-MM-dd").format(paymentCart?.expireDate??DateTime.now());


    final response = await _apiServices.post(AppUrl.createPaymentCart,
        body:data,
        hasToken: true);

    return BaseModel(result: null, message: 'تمت العملية بنجاح' );
  }

  Future<BaseModel> setDefault(int? paymentCartId
      ) async {
    final response = await _apiServices.post(AppUrl.getAllPaymentCarts+'${paymentCartId}/set-default/',
        hasToken: true);

    return BaseModel(result: null, message: 'تمت العملية بنجاح' );
  }

}
