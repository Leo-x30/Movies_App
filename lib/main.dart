import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Presentation/Screens/SearchScreen/SearchScreen.dart';
import 'package:movies_app/Presentation/Screens/browse/BrowseListTab.dart';
import 'package:movies_app/Presentation/Screens/homeScreen/MoviesDetails.dart';
import 'package:movies_app/Presentation/Screens/homeScreen/homeTab.dart';
import 'package:movies_app/Presentation/Screens/watchListScreen/WatchListTab.dart';
import 'package:movies_app/Presentation/SplashScreen/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          routes: {
            HomeTab.routename: (context) => HomeTab(),
            SplashScreen.routename: (context) =>  SplashScreen(),
            BrowseListTab.routename: (context) => BrowseListTab(),
            SearchTab.routename: (context) =>  SearchTab(),
            WatchListTab.routename: (context) =>  WatchListTab(),
            MoviesDetails.routeName: (context) =>  MoviesDetails(),
          },
        );
      },
    );
  }
}
