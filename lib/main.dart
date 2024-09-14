import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Screens/BrowseListTab.dart';
import 'package:movies_app/Screens/HomeScreen.dart';
import 'package:movies_app/Screens/HomeTab.dart';
import 'package:movies_app/Screens/SearchTab.dart';
import 'package:movies_app/Screens/WatchListTab.dart';
import 'package:movies_app/Screens/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routename,
          routes:{
            SplashScreen.routename:(context)=>SplashScreen(),
            HomeScreen.routename:(context)=>HomeScreen(),
            BrowseListTab.routename:(context)=>BrowseListTab(),
            HomeTab.routename:(context)=>HomeTab(),
            SearchTab.routename:(context)=>SearchTab(),
            WatchListTab.routename:(context)=>WatchListTab(),
          } ,
        );
      },
    );
  }
}
