import 'dart:async';
import 'package:flutter_base_structure/domain/model/notification_model/notification_model2.dart';
import '../../base/index.dart';
import 'index.dart';

class NotificationBloc extends BaseBloc<BaseEvent, NotificationState> {
  NotificationBloc() : super(initState: NotificationState()){
    on<GetNotificationEvent>((e,m)=>fetchNotifications(m));
  }

  @override
  void onPageInitStateEvent(PageInitStateEvent event) {
    super.onPageInitStateEvent(event);
    dispatchEvent(GetNotificationEvent());
  }

  @override
  void dispose() {
    super.close();
  }

  Future<void> fetchNotifications(Emitter<NotificationState> emitter) async {
    emit(NotificationLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      List<NotificationModel2> notifications = [
        NotificationModel2(
          id: "1",
          title: "Đơn hàng của bạn đang được chuẩn bi",
          type: "none",
        ),
        NotificationModel2(
          id: "2",
          title: "Bạn đã nhận được 1 Voucher ưu đãi 30K",
          content: "Chào mừng thành viên mới. Contrast xin gửi tặng một Voucher",
          type: "give",
          timeAgo: "3 ngày",
          tagColor: "#007AFF",
        ),
        NotificationModel2(
          id: "3",
          title: "Mừng ngày khai giảng 5-9",
          content: "Giảm ngay 30K khi mua một đồ uống bất kỳ dành cho thành viên mới",
          type: "event",
          timeAgo: "3 ngày",
          tagColor: "#FFA500",
        ),
        NotificationModel2(
          id: "4",
          title: "Cập nhật phiên bản mới",
          content: "Ứng dụng đã có bản cập nhật mới với nhiều tính năng hấp dẫn.",
          type: "news",
          timeAgo: "1 ngày",
          tagColor: "#FF0000",
        ),
        NotificationModel2(
          id: "5",
          title: "Nhận ưu đãi khi giới thiệu bạn bè",
          content: "Mời bạn bè tham gia và nhận ưu đãi hấp dẫn ngay hôm nay!",
          type: "news",
          timeAgo: "5 ngày",
          tagColor: "#00FF00",
        ),
        NotificationModel2(
          id: "6",
          title: "Nhận ưu đãi khi giới thiệu bạn bè",
          content: "Mời bạn bè tham gia và nhận ưu đãi hấp dẫn ngay hôm nay!",
          type: "news",
          timeAgo: "5 ngày",
          tagColor: "#00FF00",
        ),
        NotificationModel2(
          id: "7",
          title: "Nhận ưu đãi khi giới thiệu bạn bè",
          content: "Mời bạn bè tham gia và nhận ưu đãi hấp dẫn ngay hôm nay!",
          type: "news",
          timeAgo: "5 ngày",
          tagColor: "#00FF00",
        ),
        NotificationModel2(
          id: "8",
          title: "Nhận ưu đãi khi giới thiệu bạn bè",
          content: "Mời bạn bè tham gia và nhận ưu đãi hấp dẫn ngay hôm nay!",
          type: "news",
          timeAgo: "5 ngày",
          tagColor: "#00FF00",
        ),
      ];

      emit(NotificationLoadSuccess(notifications));
    } catch (e) {
      emit(NotificationLoadError("Không thể tải thông báo"));
    }
  }
}

