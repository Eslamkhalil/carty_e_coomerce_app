import 'package:carty_e_coomerce_app/constants/constant.dart';
import 'package:carty_e_coomerce_app/data/network/dio_helper.dart';
import 'package:flutter/cupertino.dart';

import '../../constants/end_point.dart';
import '../models/notifications_model.dart';

class NotificationsRepo {
  DioHelper dio;

  NotificationsRepo({required this.dio});

  Future<NotificationsModel> fetchNotifications() {
    return dio.getData(url: notifications, token: token).then(
          (value) => NotificationsModel.fromJson(value.data),
        );
  }
}
