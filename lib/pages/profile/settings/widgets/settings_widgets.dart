import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/color.dart';

import '../../../../common/widgets/base_text_widget.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    title: reusableText(text: 'Settings'),
  );
}

Widget settingButton(BuildContext context, void Function()? func) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        shadowColor: Colors.grey.withOpacity(0.2),
        surfaceTintColor: AppColors.primaryBackground,
        backgroundColor: AppColors.primaryBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Confirm Logout'),
                content: Text('Are you sure you want to logout?'),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Cancel')),
                  TextButton(
                      onPressed: func,
                      child: Text(
                        'Logout',
                        style: TextStyle(
                            color: AppColors.primaryElement,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.sp),
                      )),
                ],
              );
            });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 6.h),
        child: Wrap(
          spacing: 6.h,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            Image.asset('assets/icons/log-out.png'),
            Text(
              'Logout',
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp),
            )
          ],
        ),
      ));
}
