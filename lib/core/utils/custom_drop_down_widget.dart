import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../resources/colors_managers.dart';

class CustomDropDownFormField extends StatefulWidget {
  const CustomDropDownFormField({
    super.key,
    this.selectedValue,
    required this.dropDownList,
    required this.hint,
    this.validator,
    this.initialValue,
    this.onChanged,
    this.prefixIcon,
  });

  final List<String> dropDownList;
  final String hint;
  final IconData? prefixIcon;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String?>? onChanged;
  final ValueChanged<String?>? selectedValue;

  @override
  State<CustomDropDownFormField> createState() =>
      _CustomDropDownFormFieldState();
}

class _CustomDropDownFormFieldState extends State<CustomDropDownFormField> {
  String? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: DropdownButtonFormField<String>(
        hint: Text(
          widget.hint,
          style: TextStyle(
            fontSize: 12.sp,
          ),
        ),
        validator: widget.validator ??
            (value) {
              if (value == null || value.trim().isEmpty) {
                return StringsManager.emptyValidator;
              }
              return null;
            },
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorsManager.mainColor,
            ),
          ),
          prefixIcon: widget.prefixIcon != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      widget.prefixIcon,
                      size: 20.sp,
                    ),
                  ],
                )
              : null,
        ),
        value: _selected,
        items: widget.dropDownList.map((e) {
          return DropdownMenuItem<String>(
            value: e,
            child: Text(
              e,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            _selected = newValue;
            if (widget.selectedValue != null) {
              widget.selectedValue!(newValue);
            }
            if (widget.onChanged != null) {
              widget.onChanged!(newValue);
            }
          });
        },
      ),
    );
  }
}
