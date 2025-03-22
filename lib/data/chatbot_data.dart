import 'dart:convert';

import 'package:http/http.dart' as http;

class ChatbotData {
  //get chat data from api
  Future<String> getChatbotAnswer(String question) async {
    //call api
    final response = await http.post(
      Uri.parse("https://172.172.40.21:3000/api/chatbot/?QUESTION=$question"),
    );

    //encode data
    final data = jsonDecode(response.body);

    return data['answer'];
  }
}
