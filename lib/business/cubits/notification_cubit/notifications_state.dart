abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}

class NotificationsLoading extends NotificationsState {}

class NotificationsSuccess extends NotificationsState {}

class NotificationsError extends NotificationsState {
  dynamic error;

  NotificationsError({required this.error});
}
