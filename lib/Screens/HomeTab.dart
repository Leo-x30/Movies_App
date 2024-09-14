import 'package:flutter/material.dart';
import 'package:movies_app/Screens/build%20item.dart';
import 'package:movies_app/Screens/new%20release%20item.dart';

class HomeTab extends StatelessWidget {
  static const String routename = 'hometab';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Stack(
          children: [
            // Dora and the lost city of gold movie
            Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: Container(
                height: 200,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon for the movie image placeholder
                    Icon(
                      Icons.movie, // Replace with image from API later
                      size: 100,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 10),
                    // Text Description
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dora and the lost city of gold",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "2019  PG-13  2h 7m",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          SizedBox(height: 10),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.play_circle_fill, color: Colors.orange, size: 40),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // New Releases Section
            Positioned(
              top: 260,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New Releases",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  // New Releases List
                  SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        BuildReleaseItem(
                          icon: Icons.movie,
                          title: "Narcos",
                          duration: "1h 45m",
                        ),
                        BuildReleaseItem(
                          icon: Icons.movie,
                          title: "Deadpool 2",
                          duration: "1h 59m",
                        ),
                        BuildReleaseItem(
                          icon: Icons.movie,
                          title: "Annabelle",
                          duration: "1h 30m",
                        ),
                        BuildReleaseItem(
                          icon: Icons.movie,
                          title: "Toy Story 4",
                          duration: "1h 40m",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Recommended Section
            Positioned(
              top: 430,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recommended",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  // Recommended List
                  SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        BuildRecommendedItem(
                          icon: Icons.movie,
                          title: "Deadpool 2",
                          duration: "1h 59m",
                          rating: "7.7",
                        ),
                        BuildRecommendedItem(
                          icon: Icons.movie,
                          title: "Deadpool 2",
                          duration: "1h 59m",
                          rating: "7.7",
                        ),
                        BuildRecommendedItem(
                          icon: Icons.movie,
                          title: "Deadpool 2",
                          duration: "1h 59m",
                          rating: "7.7",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
