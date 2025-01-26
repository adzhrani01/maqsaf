
import 'package:maqsaf_app/core/data/models/item_model.dart';

import '../../../../../../core/data/models/base_model.dart';
import '../../../../../../core/domain/services/api_service.dart';
import '../../../../../../core/utils/app_url.dart';
import '../../models/order_model.dart';

class OrdersRemoteDataSource  {
  final ApiServices _apiServices;

  OrdersRemoteDataSource(this._apiServices);
  


  Future<BaseModel> getAllOrders() async {

    Map<String, String> queryParams={};


    final response = await _apiServices.get(AppUrl.getAllOrders,
        queryParams: queryParams,
        // body: data,
        hasToken: true);

    return BaseModel.fromJson(
      response,
          (json) => BaseModels.fromJson(json,OrderModel.fromJson),
    );
  }

  Future<BaseModel> createOrder(
      int? itemId,int? studentId
      ) async {
    var data={
      "item":itemId,
      "student":studentId,
    };



    final response = await _apiServices.post(AppUrl.createOrder,
        body:data,
        hasToken: true);

    return BaseModel(result: null, message: 'تمت العملية بنجاح' );
  }
}
