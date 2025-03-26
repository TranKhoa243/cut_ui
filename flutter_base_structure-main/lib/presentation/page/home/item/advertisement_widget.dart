import 'package:flutter/material.dart';
import 'package:flutter_base_structure/presentation/resources/icons/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AdvertisementWidget extends StatefulWidget {
  const AdvertisementWidget({super.key});

  @override
  State<AdvertisementWidget> createState() => _AdvertisementWidgetState();
}

class _AdvertisementWidgetState extends State<AdvertisementWidget> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  final imagesB = [
    AppImages.icBannerHome,
    AppImages.icBannerHome,
    AppImages.icBannerHome,
  ];
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 190,
              width: double.infinity,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: imagesB.length,
                itemBuilder: (context, i) {
                  return Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: AspectRatio(
                            aspectRatio: 414 / 552,
                            child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                imagesB[_currentPage],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                          bottom: 38,
                          left: 21.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Contrast\n Coffee',style: TextStyle(color: Colors.white,fontSize: 12),),
                              Gap(1),
                              Text('25% Off',style: TextStyle(color: Colors.red,fontSize: 20),),
                              Gap(1),
                              Text('Alamole pizza',style: TextStyle(color: Colors.white,fontSize: 20),),
                              Gap(3),
                              Text('12 - 24 August 2022',style: TextStyle(color: Colors.white,fontSize: 12),),
                            ],
                          ))
                    ],
                  );
                },
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter, // Căn giữa theo chiều ngang và sát đáy
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
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
      ],
    );
  }
}
