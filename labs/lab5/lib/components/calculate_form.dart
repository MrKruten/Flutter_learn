import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab5/screens/cubit/main_screen_cubit.dart';


class CalculateForm extends StatefulWidget {
  CalculateForm({Key? key}) : super(key: key);

  @override
  _CalculateForm createState() => _CalculateForm();
}

class _CalculateForm extends State<CalculateForm> {
  final _formKey = GlobalKey<FormState>();
  final _weight = TextEditingController();
  final _height = TextEditingController();
  bool _agreement = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Калькулятор индекса массы тела",
                  style: TextStyle(fontSize: 16, color: Colors.green),
                )),
            TextFormField(
              cursorColor: Colors.green,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9]+"))
              ],
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  labelText: "Вес",
                  labelStyle: TextStyle(color: Colors.green),
                  helperText: "Введите свой вес",
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green))),
              keyboardType: TextInputType.number,
              controller: _weight,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Введите свой вес";
                }
              },
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextFormField(
                  cursorColor: Colors.green,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]+"))
                  ],
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.green),
                      labelText: "Рост",
                      helperText: "Введите свой рост",
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.green))),
                  keyboardType: TextInputType.number,
                  controller: _height,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Введите свой рост";
                    }
                  },
                )),
            Padding(
              padding: EdgeInsets.all(10),
              child: CheckboxListTile(
                  activeColor: Colors.green,
                  value: _agreement,
                  title: new Text(
                      "Я согласен(на) на обработку персональных данных"),
                  onChanged: (bool? value) =>
                      setState(() => _agreement = value!)),
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: (){
                  if (_formKey.currentState!.validate() && _agreement) {
                    BlocProvider.of<MainScreenCubit>(context).calculateBMI(
                        double.parse(_weight.text), double.parse(_height.text));
                  }
                },
                child: const Text("Рассчитать"))
          ],
        ),
      ),
    );
  }
}