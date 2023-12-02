import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/values/color.dart';
import 'package:ulearning_app/common/widgets/base_text_widget.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_bloc.dart';

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

class MySearchView extends StatefulWidget {
  const MySearchView({super.key});

  @override
  MySearchViewState createState() => MySearchViewState();
}

class MySearchViewState extends State<MySearchView> {
  FocusNode focusNode = FocusNode();
  Color prefixIconColor = Colors.grey; // Default color

  @override
  void initState() {
    super.initState();

    // Add a listener to the focus node to update the prefix icon color
    focusNode.addListener(() {
      setState(() {
        prefixIconColor =
            focusNode.hasFocus ? AppColors.primaryElement : Colors.grey;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 2,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(color: Colors.grey.withOpacity(0.2), width: 0.2),
            ),
            child: TextField(
              focusNode: focusNode,
              autofocus: true,
              autocorrect: false,
              textInputAction: TextInputAction.search,
              keyboardType: TextInputType.text,
              style: const TextStyle(
                fontFamily: 'Avenir',
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                hintText: 'Search here ...',
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.54),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                prefixIcon: Container(
                  margin: const EdgeInsets.only(right: 12, left: 12),
                  width: 16,
                  height: 16,
                  child: Image.asset(
                    'assets/icons/search.png',
                    color: prefixIconColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                    width: 0.2,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.blue, // Replace with your color
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Image.asset(
                'assets/icons/options.png',
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}

Widget slidersView(BuildContext context, HomePageState state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            print('index: $value  ');
            context.read<HomePageBloc>().add(HomePageDotsEvent(value));
          },
          children: [
            _slidersContainer(),
            _slidersContainer(path: 'assets/icons/Image(1).png'),
            _slidersContainer(path: 'assets/icons/Image(2).png'),
          ],
        ),
      ),
      DotsIndicator(
        dotsCount: 3,
        position: state.index,
        decorator: DotsDecorator(
            color: AppColors.primaryThreeElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(17, 5),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r))),
      )
    ],
  );
}

Widget _slidersContainer({String path = 'assets/icons/Art.png'}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20.r)),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(path),
      ),
    ),
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            reusableText(text: 'Choose your course'),
            GestureDetector(
              child: reusableText(
                text: 'See all',
                color: AppColors.primaryThreeElementText,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 12.w),
        child: Wrap(
          alignment: WrapAlignment.start,
          direction: Axis.horizontal,
          spacing: 10.h,
          children: [
            _reusableMenuText(menuText: 'All'),
            _reusableMenuText(
                menuText: 'Popular',
                textColor: AppColors.primaryThreeElementText,
                bgColor: Colors.transparent),
            _reusableMenuText(
                menuText: 'Newest',
                textColor: AppColors.primaryThreeElementText,
                bgColor: Colors.transparent),
          ],
        ),
      )
    ],
  );
}

Widget _reusableMenuText(
    {required String menuText,
    Color textColor = AppColors.primaryElementText,
    Color bgColor = AppColors.primaryElement}) {
  return Container(
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(7.w),
      border: Border.all(color: bgColor),
    ),
    padding: EdgeInsets.only(
      left: 16.w,
      right: 16.w,
      top: 2.h,
      bottom: 2.h,
    ),
    child: reusableText(
        fontSize: 14,
        text: menuText,
        color: textColor,
        fontWeight: FontWeight.normal),
  );
}

Widget courseGrid() {
  return Container(
    padding: EdgeInsets.all(12.h),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        image: const DecorationImage(
            fit: BoxFit.fill, image: AssetImage('assets/icons/Image(1).png'))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Best course for IT',
          maxLines: 1,
          textAlign: TextAlign.left,
          overflow: TextOverflow.fade,
          softWrap: false,
          style: TextStyle(
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.bold,
              fontSize: 11.sp),
        ),
        SizedBox(height: 5.h),
        Text(
          'Flutter best course',
          maxLines: 1,
          textAlign: TextAlign.left,
          overflow: TextOverflow.fade,
          softWrap: false,
          style: TextStyle(
              color: AppColors.primaryFourElementText,
              fontWeight: FontWeight.normal,
              fontSize: 11.sp),
        ),
      ],
    ),
  );
}
