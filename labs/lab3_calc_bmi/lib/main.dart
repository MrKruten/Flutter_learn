import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Хазов Даниил Вадимович'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(child: CalculateForm()),
    ));
  }
}

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
                onPressed: () {
                  if (_formKey.currentState!.validate() && _agreement) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ResultCalculate(_weight.text, _height.text)));
                  }
                },
                child: const Text("Рассчитать"))
          ],
        ),
      ),
    );
  }
}

class ResultCalculate extends StatelessWidget {
  late final double _bmi;
  late final String _result;

  @override
  ResultCalculate(String weight, String height) {
    this._bmi = calculate(double.parse(weight), double.parse(height));
    this._result = resultBMI(this._bmi);
  }

  double calculate(double weight, double height) {
    return weight / (height * height) * 10000;
  }

  String resultBMI(double bmi) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Хазов Даниил Вадимович'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Ваш индекс массы тела: ${_bmi.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                )),
            Text('Данное значение ИМТ соответствует\n$_result',
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
                      Navigator.pop(context);
                    },
                    child: Text("Рассчитать заново")))
          ],
        ),
      )),
    );
  }
}
