
import 'package:maqsaf_app/core/data/models/item_model.dart';

import '../../../../../../core/data/models/base_model.dart';
import '../../../../../../core/domain/services/api_service.dart';
import '../../../../../../core/utils/app_url.dart';
import '../../models/food_model.dart';

class ItemsRemoteDataSource  {
  final ApiServices _apiServices;

  ItemsRemoteDataSource(this._apiServices);
  


  Future<BaseModel> getAllItems() async {

    Map<String, String> queryParams={};


    final response = await _apiServices.get(AppUrl.getAllItems,
        queryParams: queryParams,
        // body: data,
        hasToken: true);

    return BaseModel.fromJson(
        {"result":response},
          (json) => BaseModels.fromJson(json,FoodModel.fromJson),
    );
  }

}
