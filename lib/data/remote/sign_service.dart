import 'package:ai_chat_flutter/data/model/sign_data_model/sign_data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignService {
  final String baseUrl = 'https://rasa-test.surdo24.ru/dict/signs';

  Future<SignDataModel> searchSigns(String word) async {
    final response = await http.get(Uri.parse('$baseUrl?search=$word'));
    if (response.statusCode == 200) {
      //оптимизируем парсинг
      return compute(parseSigns, response);
    } else {
      throw Exception('Failed to load signs');
    }
  }

  SignDataModel parseSigns(final responseBody) {
    final responseData = SignDataModel.fromJson(
      json.decode(
        utf8.decode(responseBody.bodyBytes),
      ),
    );
    return responseData;
  }
}
