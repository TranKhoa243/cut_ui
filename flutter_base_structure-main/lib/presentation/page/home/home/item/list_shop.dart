import 'package:driver_app/common/component/image/image_cache_network.dart';
import 'package:driver_app/common/extension/list_extension.dart';
import 'package:driver_app/common/utils/device_utils.dart';
import 'package:driver_app/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ListShop extends StatelessWidget {
  const ListShop({super.key});

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
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 160,
            width: DeviceUtils.size.width * 197 / 375,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ImageCacheNetwork(
              urlImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSap6Gltpm6lU-FLnq1F-hnyHmcK9QbDzOhDw&s',
              boxFit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.red,
              ),
              child: Center(
                child: SizedBox(
                    height:16,width:16,child: Assets.icons.navigation.svg())
              ),
            ),
          ),
          Positioned(
              left: 10,
              bottom: 10,
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Contrast Văn Chương', style: TextStyle(color: Colors.white, fontSize: 12),),
            Gap(4),
            Text('264 ngõ Văn Chương, Khâm Thiên,\n Đống Đa, Hà Nội', style: TextStyle(color: Colors.white, fontSize: 10),)
          ],))
        ],
      ),
    );
  }
}
