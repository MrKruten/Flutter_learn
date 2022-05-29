import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab5/screens/table_screen.dart';

import 'cubit/table_screen_cubit.dart';

class TableScreenProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TableScreenCubit>(
      create: (context) => TableScreenCubit(),
      child: TableScreen(),
    );
  }
}