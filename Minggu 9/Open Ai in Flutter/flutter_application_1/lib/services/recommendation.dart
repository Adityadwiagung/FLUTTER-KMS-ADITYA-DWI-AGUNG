import 'dart:convert';

import 'package:flutter_application_1/constant/open_ai.dart';
import 'package:flutter_application_1/models/openai_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class RecommendationSercive {
  static Future<GptData> getRecommendation({
    required String cameraRes,
    required String internalStorage,
    required String budget,
  }) async {
    late GptData  gptData = GptData(
      id: "id", 
      object: "", 
      created: 0, 
      model: "", 
      choices: [], 
      usage: Usage(completionTokens: 0, promptTokens: 0, totalTokens: 0),
    );

    try{
      var url = Uri.parse("https://api.openai.com/v1/completions");

      Map<String, String> headers = {
        'Content-Type':'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer $apiKey'
      };

      final formatCurrency = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'IDR ',
        decimalDigits: 0,
      );

      String phoneBudget = formatCurrency.format(int.parse(budget));

      String promptData = "You are a smartphone expert. Please give me a smartphone recommendation with $cameraRes MP Resolution Camera and $internalStorage Internatl Storage with budget equals to $phoneBudget";

      final data = jsonEncode({
        "model": "text-davinci-003",
        "prompt": promptData,
        "temperature": 0.4,
        "max_tokens": 64,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      });


      var response = await http.post(
        url, 
        headers: 
        headers, body: data
        );
      if (response.statusCode == 200) {
        gptData = gptDataFromJson(response.body);
      }
    } catch (e) {
      throw Exception('Terjadi error saat mengirim request');
    }

    return gptData;
  }
}