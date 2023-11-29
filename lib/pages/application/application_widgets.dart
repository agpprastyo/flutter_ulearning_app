import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/color.dart';
import 'package:ulearning_app/pages/application/bloc/app_bloc.dart';
import 'package:ulearning_app/pages/home/home_page.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    const HomePage(),
    const Center(child: Text('Search')),
    const Center(child: Text('Course')),
    const Center(child: Text('Chat')),
    const Center(child: Text('Profile')),
  ];

  return _widget[index];
}

List<BottomNavigationBarItem> getBottomTabs(AppState state) {
  return [
    BottomNavigationBarItem(
        icon: SizedBox(
          height: 15.h,
          width: 15.h,
          child: Image.asset(
            'assets/icons/home.png',
            color: state.index == 0
                ? AppColors.primaryElement
                : AppColors.primaryFourElementText,
          ),
        ),
        label: 'Home'),
    BottomNavigationBarItem(
        icon: SizedBox(
          height: 15.h,
          width: 15.h,
          child: Image.asset(
            'assets/icons/search2.png',
            color: state.index == 1
                ? AppColors.primaryElement
                : AppColors.primaryFourElementText,
          ),
        ),
        label: 'Search'),
    BottomNavigationBarItem(
        icon: SizedBox(
          height: 15.h,
          width: 15.h,
          child: Image.asset(
            'assets/icons/play-circle1.png',
            color: state.index == 2
                ? AppColors.primaryElement
                : AppColors.primaryFourElementText,
          ),
        ),
        label: 'Course'),
    BottomNavigationBarItem(
        icon: SizedBox(
          height: 15.h,
          width: 15.h,
          child: Image.asset(
            'assets/icons/message-circle.png',
            color: state.index == 3
                ? AppColors.primaryElement
                : AppColors.primaryFourElementText,
          ),
        ),
        label: 'Chat'),
    BottomNavigationBarItem(
        icon: SizedBox(
          height: 15.h,
          width: 15.h,
          child: Image.asset(
            'assets/icons/person2.png',
            color: state.index == 4
                ? AppColors.primaryElement
                : AppColors.primaryFourElementText,
          ),
        ),
        label: 'Profile'),
  ];
}
