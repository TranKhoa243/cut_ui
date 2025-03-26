import 'package:driver_app/common/component/image/image_cache_network.dart';
import 'package:driver_app/common/extension/list_extension.dart';
import 'package:driver_app/common/utils/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EventListView extends StatelessWidget {
  const EventListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
        5,
            (index) => _itemStatus(),
      ).toList().separator((index) => Gap(12)),
    );
  }
  Widget _itemStatus() {
    return Container(// Khoảng cách giữa các item
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: DeviceUtils.size.width * 226 / 375,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0xFF939393)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageCacheNetwork(
                    urlImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE8IeDwUcPcg2ijYjZwyMnLAQLaZn3KXu-zA&s',
                    width: DeviceUtils.size.width * 226 / 375,
                    boxFit: BoxFit.fill,
                    height: 126,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 8, 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tặng Sticker chúc mừng ngày Quốc\nKhánh 2-9',
                          style: const TextStyle(fontSize: 12),
                        ),
                        const Gap(6),
                        const Text(
                          'Diễn ra tại tất cả các cơ sở của Contrast',
                          style: TextStyle(color: Color(0xFF7C7C7C), fontSize: 10),
                        ),
                        const Gap(12),
                        const Text(
                          'Tìm hiểu thêm ->',
                          style: TextStyle(
                            color: Color(0xFF7C7C7C),
                            fontSize: 10,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              left: 12,
              top: 12,
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white.withOpacity(0.7),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '10',
                        style: TextStyle(color: Color(0xFFD91E18), fontSize: 14),
                      ),
                      const Text(
                        'TH 6',
                        style: TextStyle(color: Color(0xFFD91E18), fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
