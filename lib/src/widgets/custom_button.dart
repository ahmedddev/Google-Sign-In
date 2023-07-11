import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class MyCustomButton extends StatelessWidget {

  const MyCustomButton(
      {Key? key,
      required this.label,
      required this.backgroundColor,
      required this.onTap,
      this.borderRadius,
      required this.labelStyle,
      })
      : super(key: key);

  final String? label;
  final Color? backgroundColor;
  final TextStyle labelStyle;
  final Function? onTap;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!(),
      child: Container(
        width: 350.w,
        height: 48.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
            color: backgroundColor,
            ),
        child: Center(
          child: Text(
            label!,
            style: labelStyle,
          ),
        ),
      ),
    );
  }
}
