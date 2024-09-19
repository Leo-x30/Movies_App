import 'package:flutter/material.dart';

class Moviecard extends StatelessWidget {
  final String title;
  final String? posterPath;  // Changed to nullable
  final String rate;
  final VoidCallback onTap;

  Moviecard({required this.title, required this.posterPath, required this.rate, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Base URL for the images (replace with the actual base URL for your API)
    const String baseUrl = "https://image.tmdb.org/t/p/w500";

    // Handle case where posterPath is null or invalid
    final String imageUrl = (posterPath != null && posterPath!.startsWith('/'))
        ? '$baseUrl$posterPath'
        : 'https://siskiyou.sou.edu/wp-content/uploads/2022/03/intro-1644532027.webp'; // Fallback image

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 150, // Adjusted width
                height: 240, // Adjusted height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl), // Updated with the final imageUrl
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.all(4),
                  color: Colors.black54,
                  child: Text(
                    rate,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
