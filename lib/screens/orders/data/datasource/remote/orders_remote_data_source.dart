
import 'package:maqsaf_app/core/data/models/item_model.dart';

import '../../../../../../core/data/models/base_model.dart';
import '../../../../../../core/domain/services/api_service.dart';
import '../../../../../../core/utils/app_url.dart';
import '../../../../carts/data/models/item_cart_model.dart';
import '../../../../payment_carts/data/models/payment_cart_model.dart';
import '../../models/order_model.dart';

class OrdersRemoteDataSource  {
  final ApiServices _apiServices;

  OrdersRemoteDataSource(this._apiServices);
  


  Future<BaseModel> getAllOrders(int? studentId) async {

    Map<String, String> queryParams={};


    final response = await _apiServices.get(AppUrl.getAllOrders+"$studentId",
        queryParams: queryParams,
        // body: data,
        hasToken: true);
    print(response);
    return BaseModel.fromJson(

      {"result":response},
          (json) => BaseModels.fromJson(json,OrderModel.fromJson),
    );
  }

  Future<BaseModel> createOrder(
      List<ItemCartModel>? items,String? totalPrice,int? studentId,int? paymentType,PaymentCartModel? paymentCart
      ) async {
    var data={
      "items":(items??[]).map((e)=>e.toJson()).toList(),
      // "student":studentId,
      "total_price":totalPrice,
      "payment_type":paymentType,
      "card":paymentCart?.toJson(),
      "date":"2025-01-30"
    };



    final response = await _apiServices.post(AppUrl.scheduledOrder+"${studentId}/create/",
        body:data,
        hasToken: true);

    return BaseModel(result: null, message: 'تمت العملية بنجاح' );
  }
}
