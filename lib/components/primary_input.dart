import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants.dart';

class PrimaryInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String?)? onChange;
  final String hint;
  final Function()? onTap;
  final EdgeInsets? contentPadding;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final bool? enabled;
  final String? prefixIcon;
  final String? prefixText;
  final bool? readOnly;
  final Widget? suffixIcon;
  const PrimaryInputField({Key? key, required this.controller, this.validator, this.onTap, this.contentPadding, this.textInputType, this.textInputAction, this.onChange, required this.hint, this.maxLength, this.enabled, this.prefixIcon, this.prefixText, this.readOnly = false, this.maxLines = 1, this.minLines = 1, this.suffixIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      readOnly: readOnly!,
      keyboardType: textInputType ?? TextInputType.name,
      textCapitalization: TextCapitalization.words,
      textInputAction: textInputAction ?? TextInputAction.next,
      style: TextStyle(
        color: kPrimaryTextColorDark
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: kTextInputHintColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: kTextInputBorderColor
          )
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: kTextInputBorderColor
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: kTextInputBorderColor
          )
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.red.shade400
          )
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.red.shade400
          )
        ),
        suffixIcon: suffixIcon,
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        prefixIcon: prefixIcon == null ? null : Padding(
          padding: const EdgeInsets.only(left: 10, right: 8),
          child: SvgPicture.asset(prefixIcon!, color: kTextInputIconColor),
        ),
        prefixIconConstraints: const BoxConstraints.tightFor(
          width: 48
        ),
        prefixText: prefixText,
        /*filled: true,
        fillColor: Colors.grey.shade50*/
      ),
      validator: validator,
      onTap: onTap,
      onChanged: onChange,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}

