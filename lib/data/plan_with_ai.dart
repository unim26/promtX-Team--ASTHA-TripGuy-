import 'dart:convert';
import 'dart:io';

import 'package:tripguy/models/transport_model.dart';
import 'package:http/http.dart' as http;

class PlanWithAi {
  //function to get data from nlp
  Future<List> getCombinationOfTransport(String? source, int? budget) async {
//try to get response
    try {
      final body = {
        'source': source,
        'destination': 'Dehradun',
        'budget': budget
      };
      final jsonString = json.encode(body);
      final uri =
          Uri.parse("http://localhost:3000/api/nlp-find-trans/search-trans/");
      final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
      final response = await http.post(uri, headers: headers, body: jsonString);

      

      final data = jsonDecode(response.body)['combinations'];
      return data;
    } catch (e) {
      print("ERROR in getting combition of transport $e");
      throw Error();
    }
  }
}
