import 'package:driver_app/common/app/theme/device_constants.dart';
import 'package:driver_app/common/component/image/image_cache_network.dart';
import 'package:driver_app/common/constants/app_constants.dart';
import 'package:driver_app/common/routes/app_routes.dart';
import 'package:driver_app/common/utils/device_utils.dart';
import 'package:driver_app/features/home/item/new_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../generated/assets.gen.dart';
import 'item/advertisement_widget.dart';
import 'item/list_shop.dart';

class HomeMenuPage extends StatelessWidget {
  const HomeMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color(0xFFFCFCFC),
        padding: EdgeInsets.fromLTRB(AppConstant.paddingHorizontal, DeviceUtils.padding.top, AppConstant.paddingHorizontal, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const ClipOval(
                        child: ImageCacheNetwork(
                          urlImage:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjDGMp734S91sDuUFqL51_xRTXS15iiRoHew&s",
                          width: 41,
                          boxFit: BoxFit.cover,
                          height: 41,
                        ),
                      ),
                    ),
                    const Gap(15),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Text('Contrast xin chào 👋'),
                        Text('Long Duy Lương'),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
      
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        child: SizedBox(
                            height: 28,
                            width: 28,
                            child: Center(
                              child: Assets.icons.ticketStar.svg(),
                            )),
                      ),
                    ),
                    Gap(8),
                    InkWell(
                      onTap: () {
                        context.push(
                          Routes.notification,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        child: SizedBox(
                            height: 28,
                            width: 28,
                            child: Center(
                              child: Assets.icons.notification.svg(),
                            )),
                      ),
                    )
                  ],
                )
              ],
            ),
            const Gap(16.5),
            SizedBox(
              width: DeviceUtils.size.width,
                child: const ChevronDivider()),
            Gap(10),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(16, 6, 0, 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.black,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center, // Căn giữa nội dung theo chiều dọc
                        children: [
                          Text(
                            'Ví của tôi',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Row(
                            children: [
                              Text(
                                'đ 8,656.60',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(
                                height: 16,
                                width: 16,
                                child: Center(
                                  child: Assets.icons.arrowRight2.svg(),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Gap(8),
                  Container(
                  height: double.infinity,
                    padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.red,
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Center(
                            child: Assets.icons.add.svg(color: Colors.white),
                          ),
                        ),
                        Text(
                          'Nạp tiền',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Gap(16),
            AdvertisementWidget(),
            Gap(16),
            Text('Sự kiện đang diễn ra'),
            Gap(8),
            SizedBox(
                height:225,child: EventListView()),
            Gap(17.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Danh sách cửa hàng'),Text('Xem tất cả'),
            ],),
            Gap(15.5),
            SizedBox(  height:160,child: ListShop()),
            Gap(32),
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(41, 45, 50, 0.1),
                      offset: Offset(0, 8),
                      blurRadius: 25,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(12), // Thêm padding nếu cần
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.red),
                          child: Center(
                            child: SizedBox(height: 16,
                                width: 16,child: Assets.icons.smsEdit.svg()),
                          )),
                      Gap(8),
                      Text('Phản hồi')
                    ],
                  ),
                ),
              ),
              
            ),
            Gap(37)
          ],
        ),
      ),
    );
  }
}
class ChevronDivider extends StatelessWidget {
  const ChevronDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: CustomPaint(
        painter: ChevronPainter(),
      ),
    );
  }
}

class ChevronPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Vẽ nền màu F6F6F6
    Paint backgroundPaint = Paint()..color = Color(0xFFF6F6F6);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    // Vẽ đường kẻ hình chữ V
    Paint paint = Paint()
      ..color = Color(0xFFF6F6F6) // Màu của đường kẻ
      ..strokeWidth = 1 // Độ dày của đường kẻ
      ..style = PaintingStyle.stroke;

    Path path = Path();
    double midX = size.width / 2;
    double midY = size.height;

    path.moveTo(0, 0); // Bên trái trên
    path.lineTo(midX, midY); // Đỉnh giữa
    path.lineTo(size.width, 0); // Bên phải trên

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

