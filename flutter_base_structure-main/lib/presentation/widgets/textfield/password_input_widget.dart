import 'package:flutter/material.dart';
import 'package:flutter_base_structure/presentation/widgets/textfield/validated_input_field.dart';
import 'package:flutter_base_structure/core/utils/index.dart';
import 'package:flutter_base_structure/presentation/widgets/index.dart';
import '../../resources/index.dart';
import '../../styles/index.dart';

class PasswordInputWidget extends StatelessWidget {
  final PropertyController? controller;
  final Function(String)? onInputChanged;
  final String? hintText;

  const PasswordInputWidget({
    this.controller,
    this.onInputChanged,
    this.hintText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValidatedInputField(
      style: bodyLarge.copyWith(color: AppColors.gray[800]!),
      hintText:
          hintText ?? AppLocalizations.shared.commonMessagePasswordPlaceholder,
      propertyController: controller,
      validator: Validators.isPasswordValid,
      onInputChanged: onInputChanged,
      obscureText: true,
      isShowObscureControl: true,
    );
  }
}
