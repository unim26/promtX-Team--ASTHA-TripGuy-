import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

Future<List> getTrainData() async {
  try {
    //header
    final header = {
      'x-rapidapi-key': '1edcc2bb21msh4ee18dea66c0680p138382jsn8246732c0306',
      'x-rapidapi-host': 'indian-railway-irctc.p.rapidapi.com',
      'x-rapid-api': 'rapid-api-database'
    };
    //response
    final response = await rootBundle.loadString("assets/train_data.json");

    //data
    final data = jsonDecode(response);

    return data;
  } catch (e) {
    throw "ERRROR in geting train data";
  }
}
