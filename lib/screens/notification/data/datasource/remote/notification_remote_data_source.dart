
import '../../../../../../core/data/models/base_model.dart';
import '../../../../../../core/domain/services/api_service.dart';
import '../../../../../../core/utils/app_url.dart';

import '../../models/notification_model.dart';
class NotificationRemoteDataSource  {
  final ApiServices _apiServices;

  NotificationRemoteDataSource(this._apiServices);
  

  Future<BaseModel> getNotificationById(
      {required int? notificationId}
      ) async {
    var queryParams={'id':'$notificationId'};

    final response = await _apiServices.get(AppUrl.getNotificationById,
       queryParams: queryParams,
       hasToken: true);
    return BaseModel.fromJson(
      response,
          (json) => NotificationModel.fromJson(json),
    );
  }

  Future<BaseModel> getAllNotifications() async {
   final response = await _apiServices.get(AppUrl.getAllNotifications,
        hasToken: true);
    return BaseModel.fromJson(
      {"result":
      [{
        "id":1,
        "body":"sssss",
        "receiver":"ewrfdfvc",
        "topic":"ccxz\ndsdds",
      }]??
          response
      },
          (json) => BaseModels.fromJson(json,NotificationModel.fromJson),
    );
  }


}
