
import 'package:maqsaf_app/core/data/models/item_model.dart';

import '../../../../../../core/data/models/base_model.dart';
import '../../../../../../core/domain/services/api_service.dart';
import '../../../../../../core/utils/app_url.dart';

class IngredientsRemoteDataSource  {
  final ApiServices _apiServices;

  IngredientsRemoteDataSource(this._apiServices);



  Future<BaseModel> getAllIngredients() async {

    Map<String, String> queryParams={};


    final response = await _apiServices.get(AppUrl.getAllIngredients,
        queryParams: queryParams,
        // body: data,
        hasToken: true);

    return BaseModel.fromJson(
      response,
          (json) => BaseModels.fromJson(json,ItemModel.fromJson),
    );
  }

}
