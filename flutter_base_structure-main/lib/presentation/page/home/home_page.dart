import 'package:flutter/material.dart';
import 'package:flutter_base_structure/presentation/resources/icons/app_images.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../base/index.dart';
import 'index.dart';
import 'item/home_tab.dart';
class HomePage extends BasePage {

   const HomePage({super.key, required super.tag});

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState extends BasePageState<
    HomeBloc,
    HomePage,
    HomeRouter> {
  int _selectedIndex = 0;

  Widget _getTab(int index) {
      switch (index) {
        case 0:
          return const HomeTab();
        case 1:
          return const Icon(Icons.home);
        case 2:
          return const ElevatedButton(onPressed: null, child: Text('Button'));
        case 3:
          return const CircularProgressIndicator();
        case 4:
          return const FlutterLogo(size: 40);
        default:
          return const Text('Default Tab');
      }
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void stateListenerHandler(BaseState state) {
    // super.stateListenerHandler(state);
    // if (state is PersonalInformationState) {
    //   if (state.userInfo != null && state.userInfo?.success == true) {
    //     applicationBloc.postBroadcastEvent(ReloadUserDataEvent());
    //
    //     Fluttertoast.showToast(
    //         msg: AppLocalizations.shared.update_user_success,
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.CENTER,
    //         timeInSecForIosWeb: 1,
    //         backgroundColor: Colors.black38,
    //         textColor: Colors.white70,
    //         fontSize: 16.0);
    //     navigator.popBack(context: context);
    //   }
    // }
  }
  Widget _buildBTNav({
    required String title,
    required String assets,
    required int index,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Container(
          //   height: 2,
          //   width: DeviceUtils.size.width/6,
          //   margin: const EdgeInsets.only(bottom: 1),
          //   decoration: BoxDecoration(
          //     color: isSelected ? Colors.red : Colors.transparent,
          //   ),
          // ),
          SizedBox(
            height: 24,
            width: 24,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  isSelected?Colors.red:Colors.black45, BlendMode.srcIn),
              child: SvgPicture.asset(
                assets,
                fit: BoxFit.contain,
              ),
            ),
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
  Widget buildLayout(
      BuildContext context, BaseBloc<BaseEvent, BaseState> bloc) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
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
                BottomAppBar(
                  shape: const CircularNotchedRectangle(),
                  color: Colors.white,
                  elevation: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildBTNav(
                        title: "Trang chủ",
                        assets: AppImages.icHome2,
                        index: 0,
                        isSelected: _selectedIndex == 0,
                        onTap: () => _onItemTapped(0),
                      ),
                      _buildBTNav(
                        title: "Địa điểm",
                        assets: AppImages.icMap,
                        index: 1,
                        isSelected: _selectedIndex == 1,
                        onTap: () => _onItemTapped(1),
                      ),
                      _buildBTNav(
                        title: "Cửa hàng",
                        assets: AppImages.icShop,
                        index: 2,
                        isSelected: _selectedIndex == 2,
                        onTap: () => _onItemTapped(2),
                      ),
                      _buildBTNav(
                        title: "Membership",
                        assets: AppImages.icMember,
                        index: 3,
                        isSelected: _selectedIndex == 3,
                        onTap: () => _onItemTapped(3),
                      ),
                      _buildBTNav(
                        title: "Contrast Box",
                        assets: AppImages.icBox,
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
      },
    );
  }


}
