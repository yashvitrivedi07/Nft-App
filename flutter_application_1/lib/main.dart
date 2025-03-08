import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/bloc.dart';
import 'package:flutter_application_1/view/detail/detail_screen.dart';
import 'package:flutter_application_1/view/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()
{
  runApp(BlocProvider(
    create: (context) => NftBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context ,child) => child!,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Cinzel'
          ),
          routes: {
            '/': (context) => HomeScreen(),
            '/detail': (context) => DetailScreen()
          },
        )
    );
  }
}