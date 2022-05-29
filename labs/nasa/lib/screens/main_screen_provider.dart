import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/main_screen_cubit.dart';
import 'main_screen.dart';

class MainScreenProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainScreenCubit>(
        create: (context) => MainScreenCubit(),
        child: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            title: Text(
              'Traveling on curiosity',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: MainScreen(),
        ));
  }
}
