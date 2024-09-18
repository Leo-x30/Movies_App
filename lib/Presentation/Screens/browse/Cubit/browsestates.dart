import '../../../../model/Browse/MovieCategoriesResponse.dart';

abstract class Browsestates {}

class BrowseLoadingStates extends Browsestates {}

class BrowseErrorStates extends Browsestates {
  String errorMessage;
  BrowseErrorStates({required this.errorMessage});
}

class BrowseSuccessStates extends Browsestates {
  MovieCategoriesResponse response;
  BrowseSuccessStates({required this.response});
}

class BrowseInitialStates extends Browsestates {}
