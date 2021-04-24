import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app_api_flutter/screens/home/page/Homescreen.dart';

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(100, 100),
      builder: () => GetMaterialApp(
        title: "NEWS APP",
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        getPages: [
          GetPage(name: "/", page: () => HomeScreen()),
        ],
      ),
    );
  }
}