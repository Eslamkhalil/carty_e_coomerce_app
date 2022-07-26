import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/notifications_model.dart';
import '../../../data/repositories/notifications_repo.dart';
import 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit({required this.repo}) : super(NotificationsInitial());

  NotificationsRepo repo;
  NotificationsModel? model;

  static NotificationsCubit get(context) => BlocProvider.of(context);

  void getAllNotifications() {
    emit(NotificationsLoading());
    repo.fetchNotifications().then((value) {
      if (!value.status!) {
        debugPrint('${value.message}');
      }
      model = value;
      debugPrint('${value.message!}');
      emit(NotificationsSuccess());
    }).catchError((onError) {
      debugPrint(' onError notifications ${onError.toString()}');
      emit(NotificationsError(error: onError.toString()));
    });
  }
}
