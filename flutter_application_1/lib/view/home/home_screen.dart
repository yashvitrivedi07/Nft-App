import 'package:flutter/material.dart';
import 'package:flutter_application_1/color/app_color.dart';
import 'package:flutter_application_1/components/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.main,
      appBar: AppBar(
        backgroundColor: AppColor.appbar,
        actions: [
          Container(
              height: 40.h,
              width: 200.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColor.s1, AppColor.s2])),
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        Icons.search,
                        size: 18,
                        color: AppColor.fade,
                      ), // Adjust size as needed
                    ),
                    TextSpan(
                      text: " Search",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.fade,
                      ), // Adjust text style
                    ),
                  ],
                ),
              ))
        ],
        leading: Icon(Icons.circle,color: AppColor.text,),
        title: Text(
          "NFT",
          style: TextStyle(color: AppColor.text,fontWeight: FontWeight.bold,fontSize: 26.sp),
        ),
      ),
      body: Home(),
    );
  }
}
