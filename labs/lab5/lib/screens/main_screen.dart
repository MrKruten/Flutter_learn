import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab5/screens/cubit/main_screen_cubit.dart';
import 'package:lab5/screens/cubit/main_screen_state.dart';
import 'package:lab5/screens/table_screen_provider.dart';

import '../components/calculate_form.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenCubit, MainScreenState>(
        builder: (context, state) {
      if (state is MainScreenUpdateBMIState) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Хазов Даниил Вадимович'),
              centerTitle: true,
              backgroundColor: Colors.green,
              leading: IconButton(
                icon: Icon(Icons.menu_book),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TableScreenProvider()));
                },
              ),
            ),
            body: CalculateForm());
      }
      if (state is MainScreenUpdateResultState) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Хазов Даниил Вадимович'),
              centerTitle: true,
              backgroundColor: Colors.green,
              leading: GestureDetector(
                child: Icon(Icons.arrow_back),
                onTap: () => BlocProvider.of<MainScreenCubit>(context).back(),
              ),
            ),
            body: Center(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Ваш индекс массы тела: ${state.bmi.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  Text('Данное значение ИМТ соответствует\n${state.result}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          onPressed: () {
                            BlocProvider.of<MainScreenCubit>(context).back();
                          },
                          child: Text("Рассчитать заново")))
                ],
              ),
            )));
      }
      return Container();
    });
  }
}
