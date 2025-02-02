
import '../../../../../core/data/datasource/remote/api_response.dart';

import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../data/datasource/remote/Notification_remote_data_source.dart';

class NotificationRepository {
  final NotificationRemoteDataSource _remoteDataSource;

  NotificationRepository(this._remoteDataSource) ;

  Future<ApiResponse<BaseModel>>  getAllNotifications() async {
    try {
      final response = await _remoteDataSource.getAllNotifications();
     return ApiResponse.success(response);
    } catch (error) {
      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }


  Future<ApiResponse<BaseModel>> getNotificationById({required int? notificationId}) async {
    try {
      final response = await _remoteDataSource.getNotificationById(notificationId:notificationId);
      return ApiResponse.success(response);
    } catch (error) {

      return ApiResponse.failure(
        NetworkExceptions.getException(error),
      );
    }
  }

}
