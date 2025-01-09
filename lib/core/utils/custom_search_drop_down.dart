import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../resources/colors_managers.dart';
import '../resources/strings_manager.dart';

class CustomSearchDropDown extends StatefulWidget {
  const CustomSearchDropDown(
      {super.key,
      required this.list,
      required this.controller,
      this.isValidate = true,
      this.prefixIcon,
      this.onChanged});
  final List<String> list;
  final TextEditingController controller;
  final bool isValidate;
  final IconData? prefixIcon;
  final void Function(String?)? onChanged;

  @override
  State<CustomSearchDropDown> createState() => _CustomSearchDropDownState();
}

class _CustomSearchDropDownState extends State<CustomSearchDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      onChanged: (value) {
        setState(() {
          widget.controller.text = value!;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      // selectedItem: widget.controller.text,
      items: (filter, infiniteScrollProps) => widget.list,
      validator: widget.isValidate
          ? (value) {
              if (value == null || value.trim().isEmpty) {
                return StringsManager.emptyValidator;
              }
              return null;
            }
          : null,
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8),
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
      ),
      popupProps: const PopupProps.menu(
        fit: FlexFit.loose,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            labelText: 'Search...',
            contentPadding: EdgeInsets.all(16),
            border: OutlineInputBorder(),
          ),
        ),
        showSearchBox: true,
      ),
    );
  }
}
