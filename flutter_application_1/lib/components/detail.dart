import 'package:flutter/material.dart';
import 'package:flutter_application_1/color/app_color.dart';
import 'package:flutter_application_1/modal/nft_modal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    NftModal m = ModalRoute.of(context)!.settings.arguments as NftModal;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: AppColor.mtext,
                )),
            Text(
              "Aesthetic",
              style: TextStyle(
                  color: AppColor.mtext,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Icon(
                Icons.menu,
                color: AppColor.mtext,
                size: 30,
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.all(15),
          height: 400,
          width: 800,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('${m.primaryImage}'), fit: BoxFit.cover),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(300),
                topRight: Radius.circular(300),
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Text(
            "${m.title}",
            style: TextStyle(
                color: AppColor.mtext,
                fontSize: 26,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Text(
            "Name : ${m.objectName}\nDepartment : ${m.department}\nYear : ${m.accessionYear}",
            style: TextStyle(
                color: AppColor.fade,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
