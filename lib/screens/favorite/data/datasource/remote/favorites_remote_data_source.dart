
import 'package:maqsaf_app/core/data/models/item_model.dart';

import '../../../../../../core/data/models/base_model.dart';
import '../../../../../../core/domain/services/api_service.dart';
import '../../../../../../core/utils/app_url.dart';
import '../../models/favorite_model.dart';

class FavoritesRemoteDataSource  {
  final ApiServices _apiServices;

  FavoritesRemoteDataSource(this._apiServices);
  


  Future<BaseModel> getAllIFavorites() async {

    Map<String, String> queryParams={};


    final response = await _apiServices.get(AppUrl.getAllFavorites,
        queryParams: queryParams,
        // body: data,
        hasToken: true);

    return BaseModel.fromJson(
      response,
          (json) => BaseModels.fromJson(json,FavoriteModel.fromJson),
    );
  }

  Future<BaseModel> addItemForFavorite(
      int? itemId,int? studentId
      ) async {
    var data={
      "item":itemId,
      "student":studentId,
    };



    final response = await _apiServices.post(AppUrl.addItemForFavorite,
        body:data,
        hasToken: true);

    return BaseModel(result: null, message: 'تمت العملية بنجاح' );
  }

}
