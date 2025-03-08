import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/bloc.dart';
import 'package:flutter_application_1/bloc/state.dart';
import 'package:flutter_application_1/color/app_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<NftBloc>().getData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NftBloc, NftState>(
      builder: (context, state) {
        if (state.data.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15.h),
              Text(
                "Gallery",
                style: TextStyle(
                  color: AppColor.mtext,
                  fontWeight: FontWeight.bold,
                  fontSize: 26.sp,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.department.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "${state.department[index]}",
                        style:
                            TextStyle(fontSize: 20.sp, color: AppColor.mtext),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 520.h,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2.h,
                    crossAxisSpacing: 10.w,
                    mainAxisExtent: 210.h,
                  ),
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/detail',arguments: state.data[index]);
                        },
                        child: ((index ~/ 2) % 2 == 0) == (index % 2 == 0)
                            ? Container(
                                margin:
                                    EdgeInsets.only(left: 10.w, right: 10.w),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      '${state.data[index].primaryImage}',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColor.appbar, blurRadius: 5)
                                  ],
                                  border: Border.all(width: .5),
                                  borderRadius: BorderRadius.circular(100.r),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.only(
                                    left: 10.w, right: 10.w, bottom: 2.h),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      '${state.data[index].primaryImage}',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColor.appbar, blurRadius: 5)
                                  ],
                                  border: Border.all(width: .5),
                                  // borderRadius: BorderRadius.circular(200.r),
                                ),
                              ));
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
