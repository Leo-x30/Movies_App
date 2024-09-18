import 'package:movies_app/model/Browse/MovieDiscoverResponse.dart';

abstract class Discoverstates {}

class DiscoverLoadingStates extends Discoverstates {}

class DiscoverErrorStates extends Discoverstates {
  String errorMessage;
  DiscoverErrorStates({required this.errorMessage});
}

class DiscoverSuccessStates extends Discoverstates {
  MovieDiscoverResponse response;
  DiscoverSuccessStates({required this.response});
}
