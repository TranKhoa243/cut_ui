import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_base_structure/presentation/utils/index.dart';
import 'package:flutter_base_structure/presentation/widgets/choose_image_source_bottom_sheet.dart';
import 'package:flutter_base_structure/presentation/widgets/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_structure/presentation/resources/index.dart';
import 'package:flutter_base_structure/presentation/resources/localization/app_localization.dart';
import 'package:flutter_base_structure/presentation/styles/index.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
export 'package:flutter_base_structure/presentation/resources/icons/app_images.dart';
export 'package:flutter_base_structure/presentation/styles/text_style.dart';
export 'package:flutter_base_structure/presentation/styles/app_colors.dart';
export 'package:flutter_base_structure/presentation/resources/icons/app_images.dart';
export 'package:flutter_base_structure/presentation/resources/localization/app_localization.dart';
export 'package:flutter/material.dart';
export 'package:flutter_base_structure/presentation/styles/index.dart';

mixin BasePageMixin {
  Future<void> showSnackBarMessage(String msg, BuildContext context) async {
    final snackBar = SnackBar(
      backgroundColor: AppColors.primaryColor,
      content: Container(
        height: 50,
        color: AppColors.primaryColor,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(msg,
              style: bodyMedium.copyWith(
                  color: Colors.white, fontWeight: FontWeight.w500)),
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> mLaunchUrl({required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }


  hideKeyboard(context) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Future<dynamic> showWidgetDialog(
      {required BuildContext context, required Widget child}) async {
    return AlertManager.showWidgetDialog(context: context, child: child);
  }

  showToast({required String title}) {
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white70,
        fontSize: 16.0);
  }

  Future<bool> showAlert(
      {required BuildContext context,
      String? title,
      required String message,
      String? okActionTitle,
      String? cancelTitle,
      TextStyle? titleStyle,
      TextStyle? messageStyle,
      String? image,
      bool? dismissWithBackPress,
      Color primaryColor = AppColors.primaryColor}) async {
    final result = await AlertManager.showAlert(
        context: context,
        message: message,
        title: title,
        okActionTitle: okActionTitle,
        cancelTitle: cancelTitle,
        image: image,
        titleStyle: titleStyle,
        dismissWithBackPress: dismissWithBackPress,
        messageStyle: messageStyle,
        primaryColor: primaryColor);
    return result;
  }

  buildSeparator(
      {EdgeInsets padding = const EdgeInsets.all(0),
      double height = 0.5,
      Color color = AppColors.gray}) {
    return Padding(
      padding: padding,
      child: Container(
        height: height,
        color: color,
      ),
    );
  }

  buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  buildBottomLoadMore({Color? backgroundColor}) {
    return Container(
      alignment: Alignment.center,
      color: backgroundColor ?? AppColors.gray.withAlpha(150),
      child: const Center(
        child: SizedBox(
          width: 32,
          height: 32,
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }

  showBottomSheetMenu<T>(
      {required Widget child,
      required BuildContext context,
      double? height,
      bool isDismissible = false}) {
    return showModalBottomSheet<T>(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        isScrollControlled: true,
        enableDrag: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        // ),
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Center(child: child)),
              )
            ],
          );
        });
  }

  buildHeaderPageAppBar(
      {required BuildContext context,
      Key? key,
      String? title,
      TextStyle? titleStyle,
      AssetImage? leftIcon,
      Function? leftClicked,
      Function(dynamic)? rightClicked,
      AssetImage? rightIcon,
      Color? backgroundColor,
      EdgeInsets? contentPadding,
      bool? showLeftIcon,
      // generic case
      Widget? titleWidget,
      Widget? leftWidget,
      Widget? rightWidget,
      int alpha = 160,
      Color colorIconLeft = Colors.black,
      Color colorIconRight = Colors.white}) {
    return PreferredSize(
        key: key,
        preferredSize: const Size.fromHeight(50),
        child: PageHeaderWidget(
          backgroundColor: backgroundColor ?? Colors.transparent,
          title: title,
          titleStyle: titleStyle,
          leftIcon: leftIcon,
          rightIcon: rightIcon,
          showLeftIcon: showLeftIcon,
          leftClicked: leftClicked,
          rightClicked: rightClicked,
          contentPadding: contentPadding,
          titleWidget: titleWidget,
          leftWidget: leftWidget,
          rightWidget: rightWidget,
          colorIconLeft: colorIconLeft,
          colorIconRight: colorIconRight,
        ));
  }

  Widget buildShimmer({int count = 20, bool? scrollable}) {
    final children = List.generate(count, (index) => const ShimmerItemWidget());
    return ListView(
      physics: (scrollable ?? false)
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: children,
    );
  }

  Widget buildNoDataMessage() {
    return LayoutBuilder(builder: (context, constrainst) {
      return SizedBox(
        height: constrainst.maxHeight,
        child: Center(
          child: Text(
            AppLocalizations.shared.commonMessageNoData,
            style: bodyMedium.copyWith(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400),
          ),
        ),
      );
    });
  }

  openUrl({required String url}) async {
    String encodedUrl = Uri.encodeFull(url);
    Uri uri = Uri.parse(encodedUrl);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri, mode: LaunchMode.inAppWebView);
    }
  }

  showPickImageBottomSheet(BuildContext context,
      {Function(ImageSource)? onPick}) {
    showBottomSheetMenu(
        child: ChooseImageSourceBottomSheetMenu(
          onSectGallery: () => onPick?.call(ImageSource.gallery),
          onSelectCamera: () => onPick?.call(ImageSource.camera),
        ),
        context: context);
  }
}
