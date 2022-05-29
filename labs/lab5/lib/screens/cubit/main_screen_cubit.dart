import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab5/db/bmi_database.dart';
import 'package:lab5/screens/cubit/main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState>{
  MainScreenCubit(): super(MainScreenUpdateBMIState());

  void calculateBMI(double weight, double height){
    double bmi = weight / (height * height) * 10000;
    String result = _resultBMI(bmi);
    insertBMI(weight, height, bmi);
    emit(MainScreenUpdateResultState(result: result, bmi: bmi));
  }

  void back(){
    emit(MainScreenUpdateBMIState());
  }

  String _resultBMI(double bmi){
    if (bmi < 16) {
      return "выраженному дефициту массы тела";
    } else if (bmi >= 16 && bmi <= 18.5) {
      return "недостаточной массе тела";
    } else if (bmi > 18.5 && bmi <= 25) {
      return "нормальной массе тела";
    } else if (bmi > 25 && bmi <= 30) {
      return "избыточной массе тела";
    } else if (bmi > 30 && bmi <= 35) {
      return "ожирению 1-ой степени";
    } else if (bmi > 35 && bmi <= 40) {
      return "ожирению 2-ой степени";
    } else if (bmi > 40) {
      return "ожирению 3-ой степени";
    }
    return "";
  }

  void insertBMI(double weight, double height, double result){
    Map<String, dynamic> bmi = {
      "weight": weight,
      "height": height,
      "result": result
    };
    DBProvider.db.addBMI(bmi);
  }
}