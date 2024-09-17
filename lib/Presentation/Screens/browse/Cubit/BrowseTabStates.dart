import 'package:movies_app/model/CategoriesModel/MovieCategoriesResponse.dart';

abstract class BrowseTabStates {}

class BrowseTabInitialState extends BrowseTabStates {}

class BrowseTabLoadedState extends BrowseTabStates {
  final List<Genres> categories;

  BrowseTabLoadedState({required this.categories});
}