import 'package:flutter/material.dart';
import 'package:movies_app/Presentation/Screens/browse/MovieList.dart';

class GridItem extends StatelessWidget {
  final String genreName;
  final String imageUrl;
  final int genreId; // Add genreId as a parameter

  GridItem({
    Key? key,
    required this.genreName,
    required this.imageUrl,
    required this.genreId, // Accept genreId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Stack(
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  // Navigate directly by creating a MaterialPageRoute
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieList(
                        genreId: genreId,
                        genreName: genreName,
                      ),
                    ),
                  );
                },
                child: Text(
                  genreName,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
