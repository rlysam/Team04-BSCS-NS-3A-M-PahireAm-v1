import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'notification_list_widget_state.dart';

class NotificationListWidgetCubit extends Cubit<NotificationListWidgetState> {
  NotificationListWidgetCubit() : super(NotificationListWidgetInitial());
}
