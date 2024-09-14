import 'package:flutter/material.dart';

class BuildRecommendedItem extends StatelessWidget {
   IconData icon;
   String title;
   String duration;
   String rating;

  BuildRecommendedItem({
    required this.icon,
    required this.title,
    required this.duration,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 80, color: Colors.grey),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            duration,
            style: TextStyle(color: Colors.grey),
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.yellow, size: 16),
              Text(
                rating,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
