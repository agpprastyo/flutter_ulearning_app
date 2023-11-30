import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/color.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    title: Text(
      'Settings',
      style: TextStyle(
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold,
          fontSize: 16.sp),
    ),
  );
}
