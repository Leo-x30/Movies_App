import 'package:movies_app/model/CategoriesModel/MovieCategoriesResponse.dart';

abstract class CategoryStates {}

class CategoryInichialStates extends CategoryStates {}

class CategoryLoudingStates extends CategoryStates {}

class CategoryErorrStates extends CategoryStates {
  String erorrMessage;
  CategoryErorrStates({required this.erorrMessage});
}

class CategorySuccessStates extends CategoryStates {
    MovieCategoriesResponse response;
  CategorySuccessStates({required this.response});
}