import 'package:flutter/material.dart';
import 'package:flutter_base_structure/core/utils/index.dart';
import 'package:flutter_base_structure/presentation/utils/index.dart';
import 'package:flutter_base_structure/presentation/widgets/index.dart';
import 'package:flutter_base_structure/presentation/widgets/textfield/validated_input_field.dart';
import '../../resources/index.dart';
import '../../styles/index.dart';

class EmailInputWidget extends StatelessWidget {
  final PropertyController? controller;
  final Function(String)? onInputChanged;

  const EmailInputWidget({
    this.controller,
    this.onInputChanged,
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return ValidatedInputField(
      style: bodyLarge.copyWith(color: AppColors.gray[800]!),
      hintText: AppLocalizations.shared.commonMessageEmailPlaceholder,
      propertyController: controller,
      keyboardType: TextInputType.emailAddress,
      inputFormatters: emailFormatter,
      onInputChanged: onInputChanged,
    );
  }
}
