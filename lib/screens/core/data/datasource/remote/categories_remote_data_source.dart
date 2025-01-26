
import 'package:maqsaf_app/core/data/models/item_model.dart';

import '../../../../../../core/data/models/base_model.dart';
import '../../../../../../core/domain/services/api_service.dart';
import '../../../../../../core/utils/app_url.dart';

class CategoriesRemoteDataSource  {
  final ApiServices _apiServices;

  CategoriesRemoteDataSource(this._apiServices);
  


  Future<BaseModel> getAllCategories() async {

    Map<String, String> queryParams={};


    final response = await _apiServices.get(AppUrl.getAllCategories,
        queryParams: queryParams,
        // body: data,
        hasToken: true);

    return BaseModel.fromJson(
      response,
          (json) => BaseModels.fromJson(json,ItemModel.fromJson),
    );
  }

}
