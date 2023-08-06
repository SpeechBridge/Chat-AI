import 'package:ai_chat_flutter/data/model/sign_data_model/sign_data_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignService {
  final String baseUrl = 'https://rasa-test.surdo24.ru/dict/signs';

  Future<SignDataModel> searchSigns(String word) async {
    final response = await http.get(Uri.parse('$baseUrl?search=$word'));

    if (response.statusCode == 200) {
      return SignDataModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load signs');
    }
  }
}
