import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_structure/presentation/navigator/page_navigator.dart';
import 'package:flutter_base_structure/presentation/page/home/item/device_utils.dart';
import 'package:flutter_base_structure/presentation/page/home/item/list_extension.dart';
import 'package:gap/gap.dart';

import '../../../base/base_router.dart';
import '../../detail_event/index.dart';

class EventListView extends StatelessWidget {
  const EventListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
        5,
            (index) => _itemStatus(context),
      ).toList().separator((index) => Gap(12)),
    );
  }
  Widget _itemStatus(BuildContext context) {
    return Container(// Khoảng cách giữa các item
      child: InkWell(
        onTap: () {
          navigator.materialPush(context: context, page: const DetailEventPage(tag: PageTag.detailEvent));
        },
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
                  CachedNetworkImage(
                    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE8IeDwUcPcg2ijYjZwyMnLAQLaZn3KXu-zA&s",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    width: DeviceUtils.size.width * 226 / 375,
                    fit: BoxFit.cover,
                    height: 126,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(12, 10, 8, 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tặng Sticker chúc mừng ngày Quốc\nKhánh 2-9',
                          style: TextStyle(fontSize: 12),
                        ),
                        Gap(6),
                        Text(
                          'Diễn ra tại tất cả các cơ sở của Contrast',
                          style: TextStyle(color: Color(0xFF7C7C7C), fontSize: 10),
                        ),
                        Gap(12),
                        Text(
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
                child: const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '10',
                        style: TextStyle(color: Color(0xFFD91E18), fontSize: 14),
                      ),
                      Text(
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
