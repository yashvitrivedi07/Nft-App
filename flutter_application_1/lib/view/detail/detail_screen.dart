import 'package:flutter/material.dart';
import 'package:flutter_application_1/color/app_color.dart';
import 'package:flutter_application_1/components/detail.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.main,
      body: Detail(),
    );
  }
}
