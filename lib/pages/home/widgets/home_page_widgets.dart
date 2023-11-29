import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/color.dart';
import 'package:ulearning_app/pages/common_widgets.dart';

AppBar buildAppBar() {
  return AppBar(
    leadingWidth: 50.w,
    leading: Container(
      margin: EdgeInsets.only(left: 16.w, top: 18.h, bottom: 18.h),
      height: 6.h,
      width: 6.h,
      decoration: const BoxDecoration(
        // color: Colors.red,
        image: DecorationImage(
          image: AssetImage('assets/icons/menu.png'),
          fit: BoxFit.contain,
        ),
      ),
    ),
    actions: [
      Container(
        margin: EdgeInsets.only(right: 16.w),
        child: Row(
          children: [
            GestureDetector(
              child: Container(
                width: 32.h,
                height: 32.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/person.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ],
  );
}

Widget homePageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Flexible(
          flex: 2,
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                  color: AppColors.primaryFourElementText, width: 0.2.w),
            ),
            child: Row(
              children: [
                Expanded(
                  child: buildTextField(
                      hintText: 'Search here ...',
                      iconName: 'search',
                      textType: 'search',
                      textInputAction: TextInputAction.search),
                )
              ],
            ),
          )),
      SizedBox(
        width: 10.w,
      ),
      Container(
        height: 50.h,
        width: 50.h,
        color: Colors.green,
      )
    ],
  );
}
