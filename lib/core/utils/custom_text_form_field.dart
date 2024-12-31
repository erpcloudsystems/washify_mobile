import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_managers.dart';
import '../resources/strings_manager.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.initialValue,
    this.maxLines = 1,
    this.labelText,
    this.controller,
    this.isValidate = true,
    this.isEmail = false,
    this.isConfirmPassword = false,
    this.newPasswordController,
  });
  final String? hintText;
  final Icon? prefixIcon;
  final bool isPassword;
  final String? initialValue;
  final String? labelText;
  final int maxLines;
  final TextEditingController? controller;
  final bool isValidate;
  final bool isEmail;
  final bool isConfirmPassword;
  final TextEditingController? newPasswordController;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool? isObscureText;
  bool get getIsObscureText {
    isObscureText ??= widget.isPassword;
    return isObscureText!;
  }

  IconData passwordIcon = Icons.visibility_off;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLines: widget.maxLines,
      validator: widget.isValidate
          ? (value) {
              if (value!.trim().isEmpty) {
                return StringsManager.emptyValidator;
              } else if (widget.isEmail && !isEmail(value)) {
                return StringsManager.emailValidator;
              } else if (widget.isConfirmPassword &&
                  value != widget.newPasswordController!.text) {
                return StringsManager.newPasswordDoesNotMatch;
              }
              setState(() {});
              return null;
            }
          : null,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.r)),
        prefixIconColor: Colors.grey.shade600,
        suffixIconColor: ColorsManager.mainColor,
        contentPadding:
            EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 12.w),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(passwordIcon),
                onPressed: () {
                  setState(() {
                    isObscureText = !getIsObscureText;
                    if (!getIsObscureText) {
                      passwordIcon = Icons.visibility;
                    } else {
                      passwordIcon = Icons.visibility_off;
                    }
                  });
                },
              )
            : null,
        hintText: widget.hintText,
        labelText: widget.labelText,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
      ),
      obscureText: getIsObscureText,
      style: Theme.of(context).textTheme.bodyMedium,
      initialValue: widget.initialValue,
    );
  }

  bool isEmail(String value) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(value);
  }
}
