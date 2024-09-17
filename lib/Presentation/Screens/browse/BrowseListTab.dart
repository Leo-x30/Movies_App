import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/Screens/browse/Cubit/BrowseTabStates.dart';
import 'package:movies_app/Presentation/Screens/browse/Cubit/BrowseViewModel.dart';

import 'package:movies_app/Presentation/Screens/browse/gridItem.dart';

class BrowseListTab extends StatelessWidget {
  static const String routeName = 'browselisttab';
  BrowseViewModel Browes = BrowseViewModel();

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<BrowseViewModel, CategoryStates>(
        bloc: Browes..getCategory(),
        builder: (context, state) {
    return state is CategoryLoudingStates ?
      Center(child: CircularProgressIndicator(),)
      :
      Scaffold(

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
          itemCount: Browes.categoryList.length, // Number of items in the grid
          itemBuilder: (context, index) {
            return GridItem(title:  Browes.categoryList[index].name??" ");
          },
        ),
      ),
    );
    },

    );
  }
}
