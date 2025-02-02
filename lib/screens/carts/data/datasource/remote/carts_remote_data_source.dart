
import 'package:maqsaf_app/core/data/models/item_model.dart';

import '../../../../../../core/data/models/base_model.dart';
import '../../../../../../core/domain/services/api_service.dart';
import '../../../../../../core/utils/app_url.dart';
import '../../models/cart_model.dart';

class CartsRemoteDataSource  {
  final ApiServices _apiServices;

  CartsRemoteDataSource(this._apiServices);
  


  Future<BaseModel> getAllCarts() async {

    Map<String, String> queryParams={};


    final response = await _apiServices.get(AppUrl.getAllCarts,
        queryParams: queryParams,
        // body: data,
        hasToken: true);

    return BaseModel.fromJson(
      response,
          (json) => BaseModels.fromJson(json,CartModel.fromJson),
    );
  }

  Future<BaseModel> createItemCarts(
      int? itemId,int? studentId
      ) async {
    var data={
      "item":itemId,
      "student":studentId,
    };



    final response = await _apiServices.post(AppUrl.createItemCart,
        body:data,
        hasToken: true);

    return BaseModel(result: null, message: 'تمت العملية بنجاح' );
  }
}
