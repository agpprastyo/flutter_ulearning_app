import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/color.dart';

Widget reusableText(
    {required String text,
    Color color = AppColors.primaryText,
    FontWeight fontWeight = FontWeight.bold,
    int fontSize = 16}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize.sp,
    ),
  );
}
