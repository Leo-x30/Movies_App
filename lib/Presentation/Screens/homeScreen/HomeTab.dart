import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Presentation/Screens/homeScreen/Movie_details.dart';
import 'package:movies_app/Presentation/Screens/homeScreen/cubit/hometabStates.dart';
import 'package:movies_app/Presentation/Screens/homeScreen/cubit/hometabViewmodel.dart';
import 'package:movies_app/data/api/Api_manger.dart';
import 'package:movies_app/data/api/const.dart';
import 'package:movies_app/model/hometabmodel/NewRealeases.dart';
import 'package:movies_app/model/hometabmodel/RecommendedResponse.dart';
import 'package:movies_app/model/hometabmodel/hometabResponse.dart';
import 'package:movies_app/widgets/NewRealsesWidget.dart';
import 'package:movies_app/widgets/RecommndedWidget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTab extends StatefulWidget {
  static const String routename = "HomeTab";
  Hometabviewmodel viewmodel = Hometabviewmodel();

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool isfav = false;
  late Future<HometabResponse> hometabResponse;

  @override
  void initState() {
    super.initState();
    hometabResponse = ApiManager.getAllTopSide();
    widget.viewmodel.showMovies();
  }

  final Uri _url = Uri.parse('https://www.youtube.com/watch?v=OzY2r2JXsDM');

  void toggleBookmark() {
    setState(() {
      isfav = !isfav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Hometabviewmodel, HomeTabstates>(
      bloc: widget.viewmodel..showMovies(),
      builder: (BuildContext context, HomeTabstates state) {
        if (state is HomeTabLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is HometabErrostates) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        } else if (state is HometabSuccessStates) {
          final movies = state.response.results ?? [];
          return Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  Stack(
                    children: [
                      Container(
                        width: 412.w,
                        height: 300.h,
                        color: Colors.black,
                      ),
                      movies.isNotEmpty
                          ? Container(
                              width: 412.w,
                              height: 217.h,
                              child: Image.network(
                                '${Const.imagepath}${movies[12].posterPath}',
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Center(child: CircularProgressIndicator()),
                      Positioned(
                        top: 77.h,
                        left: 175.w,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: const Color.fromARGB(255, 222, 214, 214),
                          ),
                          child: IconButton(
                            onPressed: _launchUrl,
                            icon: Icon(
                              Icons.play_arrow,
                              size: 50.sp,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 100.h,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 129,
                                  height: 180,
                                  child: Image.network(
                                    '${Const.imagepath}${movies.isNotEmpty ? movies[12].posterPath : ''}',
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: -9.h,
                                  left: -11.w,
                                  child: IconButton(
                                    onPressed: () {
                                      toggleBookmark();
                                    },
                                    icon: Icon(
                                      isfav
                                          ? Icons.bookmark_added_outlined
                                          : Icons.bookmark_add_outlined,
                                      color:
                                          isfav ? Colors.yellow : Colors.white,
                                      size: 30.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 160.w,
                        top: 225.h,
                        child: Row(children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${movies.isNotEmpty ? movies[12].title : ''}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.sp,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${movies.isNotEmpty ? movies[12].originalLanguage : ''}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '${movies.isNotEmpty ? movies[12].releaseDate : ''}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, MovieDetailsPage.routeName,
                                          arguments: {
                                          
                                            'movieID': movies[12].id.toString(),
                                            'movieslist':movies
                                          });
                                    },
                                    icon: Icon(
                                      Icons.info,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: 100.w),
                        ]),
                      ),
                    ],
                  ),
                  Container(
                    color: const Color(0xff282A28),
                    height: 187.h,
                    width: 455.w,
                    child: Newrealseswidget(
                      snapshot: ApiManager.getNewRealeases(),
                      isfav: isfav,
                      toggleBookmark: toggleBookmark,
                      title: 'New Releases',
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    color: const Color(0xff282A28),
                    height: 187.h,
                    width: 455.w,
                    child: Recommndedwidget(
                      isfav: isfav,
                      snapshot: ApiManager.getRecommended(),
                      title: 'Recommended',
                      toggleBookmark: toggleBookmark,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Center(child: Text('No data available'));
      },
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(
      _url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableJavaScript: true),
    )) {
      throw Exception('Could not launch $_url');
    }
  }
}
