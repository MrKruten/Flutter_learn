import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nasa/requests/config.dart';

Future<Map<String, dynamic>> getNasaData() async{
  final String curiosity = 'curiosity/photos?';
  final request = BASE_URL + curiosity + 'sol=' + SOL + '&api_key=' + API_KEY;
  Uri url = Uri.parse(request);
  final response = await http.get(url);

  if(response.statusCode == 200){
    return json.decode(response.body);
  } else{
    throw Exception('Error: ${response.reasonPhrase}');
  }
}