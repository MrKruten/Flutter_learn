import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa/models/nasa.dart';
import 'package:nasa/requests/api.dart';
import 'package:nasa/screens/cubit/main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState>{
  MainScreenCubit(): super(MainLoadingState());

  Future<void> loadData() async{
    try{
      Map<String, dynamic> apiData = await getNasaData();
      Nasa nasaData = Nasa.fromJson(apiData);
      emit(MainLoadedState(data: nasaData));
      return;
    }catch(e){
      emit(MainErrorState());
      return;
    }
  }
}