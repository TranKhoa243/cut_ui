import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_structure/presentation/page/home/item/FDiaLog.dart';
import 'package:flutter_base_structure/presentation/page/home/item/device_utils.dart';
import 'package:flutter_base_structure/presentation/page/home/item/list_extension.dart';
import 'package:flutter_base_structure/presentation/resources/icons/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceTab extends StatefulWidget {
  const PlaceTab({super.key});

  @override
  State<PlaceTab> createState() => _PlaceTabState();
}

class _PlaceTabState extends State<PlaceTab> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.index = 0;
  }
  Future<void> _checkAndOpenMap() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      // Hiển thị popup yêu cầu quyền
      bool? userAgreed = await _showPermissionDialog( context);
      if (userAgreed == true) {
        await Geolocator.requestPermission();
        // Kiểm tra lại trạng thái quyền sau khi người dùng cấp quyền
        permission = await Geolocator.checkPermission();

        if (permission == LocationPermission.deniedForever) {
          // Người dùng từ chối vĩnh viễn, mở cài đặt app
          await Geolocator.openAppSettings();
          return;
        }
      } else {
        return;
      }
    }

    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      try {
        Position position = await Geolocator.getCurrentPosition();

        final googleMapsUrl = "https://www.google.com/maps?q=${position.latitude},${position.longitude}";
        if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
          await launchUrl(Uri.parse(googleMapsUrl));
          print('Mở Google Maps');
        } else {
          print('Không thể mở Google Maps');
          throw 'Không thể mở Google Maps';
        }
      } catch (e) {
        print('Lỗi khi lấy vị trí: $e');
      }
    } else {
      print('Không có quyền truy cập vị trí');
    }
  }

  Future<bool?> _showPermissionDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => FDiaLog(

    ));
  }
  Widget _itemStatus() {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 220,
            width: DeviceUtils.size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child:
            CachedNetworkImage(
              imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSap6Gltpm6lU-FLnq1F-hnyHmcK9QbDzOhDw&s",
              placeholder: (context, url) => const CircularProgressIndicator(),
              width: DeviceUtils.size.width,
              height: 220,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Positioned(
            right: 16,
            top: 16,
            child: Row(
              children: [
                Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.red,
                    ),
                    child: Center(
                        child: SizedBox(
                            height:16,width:16,child: SvgPicture.asset(
                          AppImages.icBag_2,
                          fit: BoxFit.cover,
                        )))
                ),
                Gap(6),
                InkWell(
                  onTap: () {
                    _showPermissionDialog(context);
                  },
                  child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.red,
                      ),
                      child: Center(
                          child: SizedBox(
                              height:16,width:16,child: SvgPicture.asset(
                            AppImages.icNavigation,
                            fit: BoxFit.cover,
                          )))
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              left: 10,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Contrast Văn Chương', style: TextStyle(color: Colors.white, fontSize: 12),),
                  const Gap(4),
                  Row(
                    children: [
                      SizedBox(
                          height:20,width:20,child: SvgPicture.asset(
                        AppImages.icLocation,
                        fit: BoxFit.cover,
                      )),Gap(5),
                       Text('264 ngõ Văn Chương, Khâm Thiên,\n Đống Đa, Hà Nội', style: TextStyle(color: Colors.white, fontSize: 10,decoration: TextDecoration.underline,decorationColor: Colors.white),),
                    ],
                  )
                ],))
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: DeviceUtils.size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.imgBgPlace),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Gap(DeviceUtils.padding.top),
          Row(
            children: [
              const Gap(20),
              Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white.withOpacity(0.1)
                  ),
                  child: Center(
                      child: SizedBox(
                          height:20,width:20,child: SvgPicture.asset(
                        AppImages.icMap2,
                        fit: BoxFit.cover,
                        color: Colors.white,
                      )))
              ),
              const Gap(16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Vị trí hiện tại',style: TextStyle(fontSize: 12,color: Colors.white),),
                      Icon(Icons.arrow_drop_down_sharp,color: Colors.white,size: 18,)
                    ],
                  ),
                  Gap(2),
                  Text('Cầu giấy, Hà Nội',style: TextStyle(fontSize: 12,color: Colors.white),),
                ],
              )
            ],
          ),
          const Gap(20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white
              ),
              child: Column(
                children: [
                  TabBar(
                    indicatorColor:Colors.red,
                    indicatorSize: TabBarIndicatorSize.tab,
                    controller: _tabController,
                    unselectedLabelStyle: const TextStyle(
                        color: Color(0xff94A3B8),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 24 / 16),
                    labelStyle: const TextStyle(
                        color: Color(0xff334155),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 24 / 16),
                    unselectedLabelColor: const Color(0xff94A3B8),
                    // labelStyle: FTypoSkin.label4.copyWith(height: 0),
                    // labelColor: const Color(0xff334155),
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 16),
                    splashBorderRadius: BorderRadius.circular(32),
                    automaticIndicatorColorAdjustment: true,
                    // overlayColor: MaterialStateProperty.all(FColorSkin.body),
                    tabs: const [
                      Tab(text: 'Danh sách',),
                      Tab(text: 'Gần tôi',),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.zero,
                            children: List.generate(
                              5,
                                  (index) => _itemStatus(),
                            ).toList().separator((index) => Gap(16)),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.zero,
                            children: List.generate(
                              5,
                                  (index) => _itemStatus(),
                            ).toList().separator((index) => Gap(16)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
