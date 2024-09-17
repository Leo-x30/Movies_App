import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/Screens/browse/Cubit/BrowseTabStates.dart';
import 'package:movies_app/data/api/Api_manger.dart';

class BrowseViewModel extends Cubit<BrowseTabStates> {
  BrowseViewModel() : super(BrowseTabInitialState());

  void fetchBrowseItems() async {
    try {
      final categories = await ApiManager.getAllCategories();
      emit(BrowseTabLoadedState(categories: categories.genres!));
    } catch (e) {
      // Handle errors (emitting an error state if needed)
      print(e);
    }
  }
}