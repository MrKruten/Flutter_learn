import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab5/db/bmi_database.dart';
import 'package:lab5/screens/cubit/table_screen_state.dart';

class TableScreenCubit extends Cubit<TableScreenState> {
  TableScreenCubit() : super(TableScreenListState());

  void setList(){
    Future<List<Map<String, dynamic>>> result = DBProvider.db.getAllBMI();
    result.then((value) => emit(TableScreenListState(list: value)));
  }
}