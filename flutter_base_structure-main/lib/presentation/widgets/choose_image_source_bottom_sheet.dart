import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_base_structure/presentation/styles/app_colors.dart';
import 'package:flutter_base_structure/presentation/styles/text_style.dart';

import '../resources/index.dart';

class ChooseImageSourceBottomSheetMenu extends StatelessWidget {
  final Function? onSectGallery;
  final Function? onSelectCamera;

  const ChooseImageSourceBottomSheetMenu(
      {Key? key, this.onSectGallery, this.onSelectCamera})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(vertical: 30),
      color: Colors.white,
      child: Column(
        children: [
          Material(
            child: InkWell(
                onTap: () async {
                  Navigator.of(context).pop();
                  onSectGallery?.call();
                },
                child: _ImagePickerItem(
                    value: AppLocalizations.shared.gallery,
                    image: AppImages.icGallery)),
          ),
          Material(
            child: InkWell(
                onTap: () async {
                  Navigator.of(context).pop();
                  onSelectCamera?.call();
                },
                child: _ImagePickerItem(
                    value: AppLocalizations.shared.camera,
                    image: AppImages.icCamera)),
          ),
        ],
      ),
    );
  }
}

class _ImagePickerItem extends StatelessWidget {
  final String value;
  final String image;

  const _ImagePickerItem({Key? key, required this.value, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: [
          SvgPicture.asset(
            image,
            color: AppColors.neutral4,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            value,
            style: titleMedium.copyWith(
                color: AppColors.text333,
                fontWeight: FontWeight.w400,
                fontSize: 14),
          ),
        ],
      ),
    );
  }
}
