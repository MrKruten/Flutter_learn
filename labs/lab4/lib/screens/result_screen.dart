import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab4/screens/cubit/result_screen_cubit.dart';
import 'package:lab4/screens/cubit/result_screen_state.dart';

import 'main_screen.dart';

class ResultScreen extends StatelessWidget {
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
