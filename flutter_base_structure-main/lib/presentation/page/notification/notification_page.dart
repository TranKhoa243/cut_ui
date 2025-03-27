import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_base_structure/domain/model/notification_model/notification_model2.dart';
import 'package:flutter_base_structure/presentation/app/index.dart';
import 'package:flutter_base_structure/presentation/page/notification/item/back_widget.dart';
import 'package:flutter_base_structure/presentation/resources/icons/app_images.dart';
import 'package:gap/gap.dart';
import '../../base/index.dart';
import 'index.dart';

class NotificationPage extends BasePage {
  const NotificationPage({super.key, required super.tag});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends BasePageState<
    NotificationBloc,
    NotificationPage,
    NotificationRouter> {
  StreamSubscription? _appEventSub;

  @override
  void dispose() {
    _appEventSub?.cancel();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    _appEventSub?.cancel();

    _appEventSub = applicationBloc.broadcastEventStream.listen((event) {
      if (event is ReloadLinkedCardEvent) {
        bloc.dispatchEvent(GetNotificationEvent());
      }
    });
  }

  Widget _buildNotificationList(List<NotificationModel2> notifications) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 16),
      itemCount: notifications.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final item = notifications[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          title: Text(
            item.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(item.content),
          trailing: Text(
            item.timeAgo,
            style: const TextStyle(color: Colors.grey),
          ),
          leading: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: Color(int.parse("0xFF${item.tagColor?.substring(1)}")),
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
  Widget _buildEmptyNotification() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppImages.imgEmtyNotification,
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
          const Gap(32),
          const Text(
            'Không có thông báo nào',
            style: TextStyle(fontSize: 16),
          ),
          const Gap(16),
          const Text(
            'Vui lòng quay lại sau để cập nhật các ưu đãi và sự kiện',
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
  Widget _buildNotificationBody(NotificationState state) {
    if (state is NotificationLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is NotificationLoadError) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 50),
            const Gap(16),
            Text(
              state.message,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    } else if (state is NotificationLoadSuccess) {
      if (state.notifications.isEmpty) {
        return _buildEmptyNotification();
      }
      return _buildNotificationList(state.notifications);
    } else {
      return _buildEmptyNotification();
    }
  }


  @override
  Widget buildLayout(
      BuildContext context, BaseBloc<BaseEvent, BaseState> bloc) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            color: const Color(0xFFFCFCFC),
            padding: EdgeInsets.fromLTRB(16, MediaQuery.of(context).padding.top, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    FBackWidget(onTap: (){
                      context.read<NotificationRouter>().onNavigateByEvent(context: context, event: NotificationBackEvent());
                    },),
                    const Gap(16),
                    const Text(
                      'Thông báo',
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    )
                  ],
                ),
                Expanded(
                  child: _buildNotificationBody(state), // Gọi hàm xử lý UI theo state
                ),
              ],
            ),
          ),
        );
      },
    );

  }
}

