import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Presentation/Screens/SearchScreen/SearchTab.dart';
import 'package:movies_app/Presentation/Screens/browse/BrowseListTab.dart';
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
            SplashScreen.routename: (context) => const SplashScreen(),
            BrowseListTab.routename: (context) => const BrowseListTab(),
            SearchTab.routename: (context) => const SearchTab(),
            WatchListTab.routename: (context) => const WatchListTab(),
          },
        );
      },
    );
  }
}
