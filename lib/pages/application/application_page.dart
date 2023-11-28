import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/color.dart';
import 'package:ulearning_app/pages/application/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: SafeArea(
          child: buildPage(_index),
        ),
        bottomNavigationBar: Container(
          width: double.maxFinite,
          height: 58.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  // offset: Offset(0, 4),
                  blurRadius: 1,
                  spreadRadius: 1,
                )
              ]),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            currentIndex: _index,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.primaryElement,
            unselectedItemColor: AppColors.primaryFourElementText,
            onTap: (value) {
              setState(() {
                _index = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 15.h,
                    width: 15.h,
                    child: Image.asset(
                      'assets/icons/home.png',
                      color: _index == 0
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
                      color: _index == 1
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
                      color: _index == 2
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
                      color: _index == 3
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
                      color: _index == 4
                          ? AppColors.primaryElement
                          : AppColors.primaryFourElementText,
                    ),
                  ),
                  label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
