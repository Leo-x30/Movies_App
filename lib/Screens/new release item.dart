import 'package:flutter/material.dart';

class BuildReleaseItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String duration;

  // Constructor to pass the values for icon, title, and duration
  BuildReleaseItem({
    required this.icon,
    required this.title,
    required this.duration,
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
        ],
      ),
    );
  }
}
