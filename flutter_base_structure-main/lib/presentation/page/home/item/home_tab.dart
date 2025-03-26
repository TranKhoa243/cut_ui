import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_structure/presentation/page/home/item/device_utils.dart';
import 'package:flutter_base_structure/presentation/resources/icons/app_images.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'advertisement_widget.dart';
import 'chevron_divider.dart';
import 'list_shop.dart';
import 'new_page.dart';


class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color(0xFFFCFCFC),
        padding: EdgeInsets.fromLTRB(16, DeviceUtils.padding.top, 16, 0),
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
                      child: ClipOval(
                        child: CachedNetworkImage(
                        imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjDGMp734S91sDuUFqL51_xRTXS15iiRoHew&s",
                        width: 41,
                        height: 41,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
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
                              child: SvgPicture.asset(
                                AppImages.icTicketStar,
                                fit: BoxFit.contain,
                              ),
                            )),
                      ),
                    ),
                    const Gap(8),
                    InkWell(
                      onTap: () {
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        child: SizedBox(
                            height: 28,
                            width: 28,
                            child: Center(
                              child: SvgPicture.asset(
                                AppImages.icNotification,
                                fit: BoxFit.contain,
                              ),
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
            const Gap(10),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 6, 0, 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.black,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center, // Căn giữa nội dung theo chiều dọc
                        children: [
                          const Text(
                            'Ví của tôi',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Row(
                            children: [
                              const Text(
                                'đ 8,656.60',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(
                                height: 16,
                                width: 16,
                                child: Center(
                                  child: SvgPicture.asset(
                                    AppImages.icArrowRight2,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const Gap(8),
                  Container(
                    height: double.infinity,
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
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
                            child: SvgPicture.asset(
                              AppImages.icAdd,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Text(
                          'Nạp tiền',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],

              ),
            ),
            const Gap(16),
            const AdvertisementWidget(),
            const Gap(16),
            const Text('Sự kiện đang diễn ra'),
            const Gap(8),
            const SizedBox(
                height:225,child: EventListView()),
            const Gap(17.5),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Danh sách cửa hàng'),Text('Xem tất cả'),
              ],),
            const Gap(15.5),
            const SizedBox(  height:160,child: ListShop()),
            const Gap(32),
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(41, 45, 50, 0.1),
                      offset: Offset(0, 8),
                      blurRadius: 25,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12), // Thêm padding nếu cần
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.red),
                          child: Center(
                            child: SizedBox(height: 16,
                                width: 16,child: SvgPicture.asset(
                                AppImages.icSmsEdit,
                                fit: BoxFit.contain,
                              ),),
                          )),
                      const Gap(8),
                      const Text('Phản hồi')
                    ],
                  ),
                ),
              ),

            ),
            const Gap(37)
          ],
        ),
      ),
    );
  }
}