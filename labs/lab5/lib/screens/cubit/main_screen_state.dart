abstract class MainScreenState{}

class MainScreenUpdateBMIState extends MainScreenState{
  MainScreenUpdateBMIState();
}

class MainScreenUpdateResultState extends MainScreenState{
  final String result;
  final double bmi;

  MainScreenUpdateResultState({required this.result, required this.bmi});
}