import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/Screens/browse/Cubit/BrowseTabStates.dart';
import 'package:movies_app/data/api/Api_manger.dart';
import 'package:movies_app/model/CategoriesModel/MovieCategoriesResponse.dart';


class BrowseViewModel extends Cubit<CategoryStates> {
  BrowseViewModel() : super(CategoryInichialStates());
  List<Genres> categoryList = [];

  void getCategory() async {
    try {
      emit(CategoryLoudingStates());
      print("loding");

      final categories = await ApiManager.getCategory();
      if (categories.success == false) {
        emit(CategoryErorrStates(
            erorrMessage: categories.status_message ?? "erorr"));
        print("erorr");
      } else {
        categoryList = categories.genres??[];
        emit(CategorySuccessStates(response: categories));
        print("success");
      }
    } catch (e) {
      // Handle errors (emitting an error state if needed)
      print(e);
    }
  }
}
