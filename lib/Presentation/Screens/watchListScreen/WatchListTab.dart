import 'package:flutter/material.dart';

class WatchListTab extends StatelessWidget {
  static const String routename = 'watchlisttab';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Browse Category'),
        backgroundColor: Colors.black87,
        elevation: 0,
      ),
    );
  }
}
