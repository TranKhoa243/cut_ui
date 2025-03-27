import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_structure/core/utils/device_info.dart';
import 'package:flutter_base_structure/presentation/app/index.dart';
import 'package:flutter_base_structure/presentation/page/home/item/device_utils.dart';
import 'package:flutter_base_structure/presentation/page/notification/item/back_widget.dart';
import '../../base/base_page_mixin.dart';
import '../../base/index.dart';
import 'index.dart';

class DetailEventPage extends BasePage {
  const DetailEventPage({super.key, required super.tag});

  @override
  State<DetailEventPage> createState() => _DetailEventPageState();
}

class _DetailEventPageState extends BasePageState<
    DetailEventBloc,
    DetailEventPage,
    DetailEventRouter> {
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
        bloc.dispatchEvent(GetDetailEventEvent());
      }
    });
  }


  @override
  Widget buildLayout(
      BuildContext context, BaseBloc<BaseEvent, BaseState> bloc) {
    return BlocBuilder<DetailEventBloc, DetailEventState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Container(height: 285,),
              Positioned(
                top: 0,
                left: 0,
                height: 245,
                child: CachedNetworkImage(
                imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE8IeDwUcPcg2ijYjZwyMnLAQLaZn3KXu-zA&s",
                placeholder: (context, url) => const CircularProgressIndicator(),
                width: DeviceUtils.size.width ,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),),
              Positioned(
                bottom: 0,
                child: Stack(
                  children: [
                    SizedBox(
                    height: 93,
                    width: DeviceUtils.size.width,
                    child: Image.asset(
                      AppImages.imgBottomBgDetailEvent,
                      fit: BoxFit.fill,
                    ),
                                  ),
                     Positioned(
                      top: 17,
                        child: Container(
                          width: DeviceUtils.size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text('Tặng Sticker chúc mừng ngày\n Quốc Khánh 2-9',style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
                        ))
                  ],
                ),),
              Positioned(
                left: 20,
                top: DeviceUtils.padding.top,
                child: FBackWidget(onTap: () {
                  context.read<DetailEventRouter>().onNavigateByEvent(
                      context: context, event: DetailEventBackEvent());
                },
                  backgroundColor: Colors.transparent,
                ),
              ),
            ],
          ),
        );
      },
    );

  }
}

