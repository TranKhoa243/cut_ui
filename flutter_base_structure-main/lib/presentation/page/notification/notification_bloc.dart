import 'dart:async';

import 'package:flutter_base_structure/domain/model/notification_model/notification_model2.dart';
import 'package:flutter_base_structure/presentation/base/base_bloc.dart';
import 'package:flutter_base_structure/presentation/base/base_event.dart';
import 'package:flutter_base_structure/presentation/page/home/home_state.dart';
import 'package:flutter_base_structure/presentation/page/notification/notification_state.dart';

class NotificationBloc extends BaseBloc<BaseEvent, NotificationState> {
  NotificationBloc() : super(initState: NotificationState());

  @override
  void onPageInitStateEvent(PageInitStateEvent event) {
    super.onPageInitStateEvent(event);
    fetchNotifications();
  }

  @override
  void dispose() {}

  // Lấy danh sách thông báo
  Future<void> fetchNotifications() async {
    emit(NotificationLoading());
    try {
      await Future.delayed(Duration(seconds: 2));
      List<NotificationModel2> notifications = [
        NotificationModel2(
          id: "1",
          title: "Bạn đã nhận được 1 Voucher ưu đãi 30K",
          content: "Chào mừng thành viên mới. Contrast xin gửi tặng một Voucher",
          type: "Tặng voucher",
          timeAgo: "3 ngày",
          tagColor: "#007AFF",
        ),
        NotificationModel2(
          id: "2",
          title: "Mừng ngày khai giảng 5-9",
          content: "Giảm ngay 30K khi mua một đồ uống bất kỳ dành cho thành viên mới",
          type: "Sự kiện",
          timeAgo: "3 ngày",
          tagColor: "#FFA500",
        ),
      ];
      emit(NotificationLoadSuccess(notifications));
    } catch (e) {
      emit(NotificationLoadError("Không thể tải thông báo"));
    }
  }

  // Đánh dấu thông báo là đã đọc
}

