import 'package:nasa/models/nasa.dart';

abstract class MainScreenState{}

class MainLoadingState extends MainScreenState{}

class MainLoadedState extends MainScreenState{
  Nasa data;
  MainLoadedState({required this.data});
}

class MainErrorState extends MainScreenState{}