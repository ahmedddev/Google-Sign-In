import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class CustomFormField extends StatefulWidget {
  CustomFormField({
    Key? key,
    required this.validator,
    required this.textEditingController,
    required this.textInputType,
    required this.hint,
    this.obscureText,
    this.readOnly,
  }) : super(key: key);

  final String hint;
  final Function(String?)? validator;
  final TextInputType textInputType;
  bool? obscureText;
  bool? readOnly = false;

  final TextEditingController textEditingController;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool hidePassword = true;

  _CustomFormFieldState();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: TextStyle(fontSize: 16.sp, color: Colors.black),
          obscureText: widget.obscureText ?? false,
          controller: widget.textEditingController,
          keyboardType: widget.textInputType,
          validator: (value) => widget.validator!(value),
          cursorColor: AppColors.customBlackColor,
          cursorHeight: 20.sp,
          readOnly: widget.readOnly ?? false,
          decoration: InputDecoration(
            suffixIcon: widget.obscureText != null
                ? InkWell(
                    onTap: () {
                      setState(() {
                        // hidePassword = !hidePassword;
                        widget.obscureText = !widget.obscureText!;
                      });
                    },
                    child: Icon(
                      widget.obscureText!
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.black,
                    ),
                  )
                : const SizedBox(),
            hintText: widget.hint,
            hintStyle: TextStyle(
                fontSize: 16.sp,
                color: AppColors.customBlackColor,
                fontWeight: FontWeight.w300),
            // contentPadding:
            //     const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            focusColor: AppColors.customThemeColor,
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.customDarkGreyColor)),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.customDarkGreyColor)),
            errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
          ),
        ),
      ],
    );
  }
}
