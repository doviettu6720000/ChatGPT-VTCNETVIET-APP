import 'dart:convert';

import 'package:http/http.dart' as http;

String apiKey = "Enter your API Key!";
var apiUrl = Uri.parse('https://api.openai.com/v1/completions');


class RemoteService {
  Map<String, String> header = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $apiKey'
  };

  Future<String> getResponse(String input) async {
    var body = {
      "model": "text-davinci-003",
      "prompt": input,
      "max_tokens": 500,
      "temperature": 0,
      "top_p": 1,
      "frequency_penalty": 0.0,
      "presence_penalty": 0.0,
      "stop": ["Human: ", "AI: "],
    };

    var response =
        await http.post(apiUrl, headers: header, body: jsonEncode(body));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      var msg = data['choices'][0]['text'].trim();
      // var msgUTF8 = utf8.encode(msg);
      var decoded = utf8.decode(msg.runes.toList());
      print(decoded);
      return decoded;
    } else {
      throw Exception('Failed to get response from OpenAI API');
    }
  }
}
