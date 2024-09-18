import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieList extends StatefulWidget {
  static const String routename = "MovieList";

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  bool isFav = false;

  void toggleBookmark() {
    setState(() {
      isFav = !isFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Movie List'),
      ),
      body: Container(
        color: const Color(0xff282A28),
        height: 350.h,
        width: double.infinity,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          itemCount: 15,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 150.w,  // Increased width
                        height: 240.h, // Increased height
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://siskiyou.sou.edu/wp-content/uploads/2022/03/intro-1644532027.webp'), // Replace with actual poster URL
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: -5.h,
                        left: -10.w,
                        child: IconButton(
                          onPressed: toggleBookmark,
                          icon: Icon(
                            isFav
                                ? Icons.bookmark_added_outlined
                                : Icons.bookmark_add_outlined,
                            color: isFav ? Colors.yellow : Colors.white,
                            size: 30.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Movie Title $index',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    'Release Date',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
