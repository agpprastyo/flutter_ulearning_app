import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/common/values/color.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    leadingWidth: 50.w,
    leading: Container(
      margin: EdgeInsets.only(left: 16.w, top: 18.h, bottom: 18.h),
      height: 6.h,
      width: 6.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/icons/menu.png'),
          fit: BoxFit.contain,
        ),
      ),
    ),
    centerTitle: true,
    title: Text(
      'Profile',
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
      Container(
        margin: EdgeInsets.only(right: 16.w),
        child: Row(
          children: [
            GestureDetector(
              child: Container(
                width: 24.h,
                height: 24.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/more-vertical.png'),
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

Center profileIconAndEditButton() {
  return Center(
    child: Container(
      alignment: Alignment.bottomRight,
      width: 80.h,
      height: 80.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          image: const DecorationImage(
              image: AssetImage('assets/icons/headpic.png'))),
      child: Image(
        width: 28.h,
        image: const AssetImage('assets/icons/edit_3.png'),
      ),
    ),
  );
}

var imagesInfo = <String, String>{
  "Settings": "settings.png",
  "Payment Details": "credit-card.png",
  "Achievement": "award.png",
  "Love": "heart(1).png",
  "Reminders": "cube.png"
};

Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        imagesInfo.length,
        (index) => GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.SETTINGS),
          child: Container(
            margin: EdgeInsets.only(bottom: 16.h),
            child: Row(
              children: [
                Container(
                  width: 42.h,
                  height: 42.h,
                  padding: EdgeInsets.all(7.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.primaryElement),
                  child: Image.asset(
                      'assets/icons/${imagesInfo.values.elementAt(index)}'),
                ),
                SizedBox(width: 16.w),
                Text(
                  imagesInfo.keys.elementAt(index),
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}
