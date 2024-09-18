import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/Screens/browse/cubit/DiscoverStates.dart';

class DiscoverViewModel extends Cubit<Discoverstates>{
  DiscoverViewModel() : super(DiscoverLoadingStates());
}