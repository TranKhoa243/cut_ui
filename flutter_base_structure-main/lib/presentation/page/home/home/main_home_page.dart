import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../common/utils/device_utils.dart';
import '../../generated/assets.gen.dart';
import 'home_page.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _selectedIndex = 0;
  final Map<int, Widget> _tabCache = {};

  Widget _getTab(int index) {
    _tabCache.putIfAbsent(index, () => const HomeMenuPage());
    return _tabCache[index]!;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBTNav({
    required String title,
    required Widget assets,
    required int index,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 2,
            width: DeviceUtils.size.width/5,
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              color: isSelected ? Colors.red : Colors.transparent,
            ),
          ),
          SizedBox(
            height: 24,
            width: 24,
            child: isSelected
                ? ColorFiltered(
              colorFilter: const ColorFilter.mode(
                  Colors.red, BlendMode.srcIn),
              child: assets,
            )
                : assets,
          ),
          const Gap(2),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.red : Colors.grey,
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const Gap(8),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: List.generate(5, (index) => _getTab(index)),
      ),

      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(20),
            BottomAppBar(
              shape: const CircularNotchedRectangle(),
              color: Colors.white,
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBTNav(
                    title: "Trang chủ",
                    assets: Assets.icons.home2.svg(),
                    index: 0,
                    isSelected: _selectedIndex == 0,
                    onTap: () => _onItemTapped(0),
                  ),
                  _buildBTNav(
                    title: "Địa điểm",
                    assets: Assets.icons.tree.svg(),
                    index: 1,
                    isSelected: _selectedIndex == 1,
                    onTap: () => _onItemTapped(1),
                  ),
                  _buildBTNav(
                    title: "Cửa hàng",
                    assets: Assets.icons.tree.svg(),
                    index: 2,
                    isSelected: _selectedIndex == 2,
                    onTap: () => _onItemTapped(2),
                  ),
                  _buildBTNav(
                    title: "Membership",
                    assets: Assets.icons.wallet3.svg(),
                    index: 3,
                    isSelected: _selectedIndex == 3,
                    onTap: () => _onItemTapped(3),
                  ),
                  _buildBTNav(
                    title: "Contrast Box",
                    assets: Assets.icons.user.svg(),
                    index: 4,
                    isSelected: _selectedIndex == 4,
                    onTap: () => _onItemTapped(4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
