import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_structure/core/utils/device_info.dart';
import 'package:flutter_base_structure/presentation/app/index.dart';
import 'package:flutter_base_structure/presentation/page/home/item/device_utils.dart';
import 'package:flutter_base_structure/presentation/page/notification/item/back_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  final imagesB = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE8IeDwUcPcg2ijYjZwyMnLAQLaZn3KXu-zA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE8IeDwUcPcg2ijYjZwyMnLAQLaZn3KXu-zA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE8IeDwUcPcg2ijYjZwyMnLAQLaZn3KXu-zA&s",
  ];
  @override
  void dispose() {
    _pageController.dispose();
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
  Widget buildTitle(String asset,String title){
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          decoration: BoxDecoration(color:  const Color(0xFFD91E18).withOpacity(0.12),borderRadius: BorderRadius.circular(4)),
          padding: const EdgeInsets.all(10),
          child: SizedBox(
              height:16,width:16,child: SvgPicture.asset(
            asset,
            fit: BoxFit.cover,
            color: Colors.red,
          )),
        ),
        const Gap(16),
        Text(title,style: const TextStyle(fontSize: 14),)
      ],
    );
  }

  @override
  Widget buildLayout(
      BuildContext context, BaseBloc<BaseEvent, BaseState> bloc) {
    return BlocBuilder<DetailEventBloc, DetailEventState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: SizedBox(
                    child: Column(
                      children: [
                        Gap(247+DeviceUtils.padding.top),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                buildTitle(AppImages.icNavigation,'24/7/2024 - 5/9/2024'),
                                const Gap(24),
                                buildTitle(AppImages.icCalendar,'Diễn ra tại tất cả các cơ sở của Contrast'),
                                const Gap(32),
                                const Text('Từ ngày 30/8-3/9 khi tới các cơ sở tại Contrast. Với mỗi hoá đơn cậu sẽ nhận đặc 1 cặp Sticker chủ đề ngày Quốc Khánh 2-9 vô cùng đáng yêu, các cậu có thể dán ở đồ dùng cá nhân hay nơi nào dễ thấy để có thể lan toa tinh thần ngày Quốc Khánh 2-9 tới với mọi người nhé',style: TextStyle(fontSize: 14),),
                                const Gap(500),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top:0,
                  height: 245,
                  child:Stack(
                    children: [
                      SizedBox(
                        height: 245,
                        width: DeviceUtils.size.width,
                        child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: _pageController,
                          onPageChanged: _onPageChanged,
                          itemCount: imagesB.length,
                          itemBuilder: (context, i) {
                            return Stack(
                              children: [
                                SizedBox(
                                  width: DeviceUtils.size.width,
                                  height: 245,
                                  child: AspectRatio(
                                    aspectRatio: 414 / 552,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: CachedNetworkImage(
                                        imageUrl: imagesB[_currentPage],
                                        placeholder: (context, url) => const CircularProgressIndicator(),
                                        width: DeviceUtils.size.width ,
                                        fit: BoxFit.cover,
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                      )
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 58),
                            child: SmoothPageIndicator(
                              controller: _pageController,
                              count: imagesB.length,
                              effect: JumpingDotEffect(
                                dotColor: Colors.white.withOpacity(0.5),
                                activeDotColor: Colors.white,
                                dotHeight: 5,
                                dotWidth: 5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                  ,),
                Positioned(
                  top: 192,
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
          ),
        );
      },
    );

  }
}

