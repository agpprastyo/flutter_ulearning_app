import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/color.dart';

AppBar buildAppBar() {
  return AppBar(
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(
          color: Colors.grey.withOpacity(0.2),
        ),
      ),
      centerTitle: true,
      title: const Text(
        'Log In',
      ));
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Center(
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 40.h),
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 40.h,
            children: [
              _reusableIcons('google'),
              _reusableIcons('apple'),
              _reusableIcons('facebook'),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      // margin: EdgeInsets.only(right: 20.w),
      child: Image.asset(
        'assets/icons/$iconName.png',
      ),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h, top: 20.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.54),
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName,
    void Function(String value)? onChanged) {
  bool obscureText = true;
  // void _toggle() {
  //   setState(() {
  //     obscureText = !obscureText;
  //   });
  // }

  return TextField(
    onChanged: onChanged,
    focusNode: FocusNode(),
    autocorrect: false,
    obscureText: textType == 'password' ? obscureText : false,
    keyboardType: textType == 'email'
        ? TextInputType.emailAddress
        : TextInputType.visiblePassword,
    style: TextStyle(
      fontFamily: 'Avenir',
      color: Colors.black,
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
    ),
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.grey.withOpacity(0.54),
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      ),
      prefixIcon: Container(
        margin: EdgeInsets.only(right: 12.w, left: 12.w),
        width: 16.w,
        height: 16.w,
        child: Image.asset(
          'assets/icons/$iconName.png',
        ),
      ),
      suffixIcon: textType == 'password'
          ? IconButton(
              icon: Icon(
                // Choose the icon based on the value of obscureText
                obscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {},
            )
          : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
        borderSide: const BorderSide(width: 1, color: Colors.black),
      ),
    ),
  );
}

Widget forgotPassword() {
  return Container(
    padding: EdgeInsets.only(top: 20.h),
    child: GestureDetector(
      onTap: () {},
      child: Text(
        'Forgot password?',
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.underline,
          decorationColor: Colors.blue,
        ),
      ),
    ),
  );
}

Widget buildLoginAndRegisterButton(
  String buttonName,
  String buttonType,
  void Function()? onPressed,
) {
  return Container(
      margin: EdgeInsets.only(
        left: 25.w,
        right: 25.w,
        bottom: buttonType == 'login' ? 20.h : 20.h,
      ),
      width: double.maxFinite,
      height: 55.h,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          elevation: 3,
          backgroundColor:
              buttonType == 'login' ? AppColors.primaryElement : Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
              side: BorderSide(
                color: buttonType == 'login' ? Colors.transparent : Colors.grey,
                width: 0.2,
              )),
        ),
        child: Text(
          buttonName,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.normal,
              color: buttonType == 'login'
                  ? AppColors.primaryBackground
                  : Colors.black),
        ),
      ));
}
