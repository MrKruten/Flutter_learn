import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab5/screens/cubit/table_screen_cubit.dart';

import 'cubit/table_screen_state.dart';

class TableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableScreenCubit, TableScreenState>(
        builder: (context, state) {
      BlocProvider.of<TableScreenCubit>(context).setList();
      if (state is TableScreenListState) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Хазов Даниил Вадимович'),
              centerTitle: true,
              backgroundColor: Colors.green,
            ),
            body: Center(
                child: Container(
              child: ListView.builder(
                itemCount: state.list?.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '${state.list?[index]['id']}: вес - ${state.list?[index]['weight']},  рост - ${state.list?[index]['height']},  ИМТ - ${state.list?[index]['result'].toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  );
                },
              ),
            )));
      }
      return Container();
    });
  }
}
