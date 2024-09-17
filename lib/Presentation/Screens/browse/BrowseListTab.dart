import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/Screens/browse/Cubit/BrowseViewModel.dart';
import 'package:movies_app/Presentation/Screens/browse/Cubit/BrowseTabStates.dart';
import 'package:movies_app/Presentation/Screens/browse/gridItem.dart';

class BrowseListTab extends StatelessWidget {
  static const String routename = 'browselisttab';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrowseViewModel()..fetchBrowseItems(),
      child: BlocBuilder<BrowseViewModel, BrowseTabStates>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black87,
            appBar: AppBar(
              title: Text('Browse Category'),
              backgroundColor: Colors.black87,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: 14, // Number of items in the grid
                itemBuilder: (context, index) {
                  return GridItem();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
