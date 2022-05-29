import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa/components/error_load.dart';
import 'package:nasa/components/list_cards.dart';
import 'package:nasa/components/loader.dart';

import 'cubit/main_screen_cubit.dart';
import 'cubit/main_screen_state.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenCubit, MainScreenState>(
        builder: (context, state) {
          if (state is MainLoadingState) {
            BlocProvider.of<MainScreenCubit>(context).loadData();
            return Loader();
          }
          if (state is MainLoadedState) {
            return ListCards(list: state.data.photos!);
          }
          if (state is MainErrorState) {
             return ErrorLoad();
          }
          return Container();
        });
  }
}