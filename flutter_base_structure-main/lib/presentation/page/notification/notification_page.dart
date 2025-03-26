import 'package:flutter/material.dart';
import 'package:flutter_base_structure/presentation/base/base_bloc.dart';
import 'package:flutter_base_structure/presentation/base/base_event.dart';
import 'package:flutter_base_structure/presentation/base/base_page.dart';
import 'package:flutter_base_structure/presentation/base/base_router.dart';
import 'package:flutter_base_structure/presentation/base/base_state.dart';
import 'package:flutter_base_structure/presentation/page/notification/notification_bloc.dart';
import 'package:flutter_base_structure/presentation/page/notification/notification_state.dart';
import 'package:flutter_base_structure/presentation/resources/icons/app_images.dart';
import 'package:gap/gap.dart';

class NotificationPage extends BasePage {
  const NotificationPage({super.key, required super.tag});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends BasePageState<
    NotificationBloc,
    NotificationPage,
    BaseRouter> {

  @override
  void initState() {
    super.initState();
    bloc.add(PageInitStateEvent());
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
                const Row(
                  children: [
                    BackButton(),
                    Gap(16),
                    Text(
                      'Thông báo',
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    )
                  ],
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 19),
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
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

