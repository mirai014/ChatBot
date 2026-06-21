import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiKey = "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";

  static Future<String> sendMessage(String message) async {
    const url = "https://api.openai.com/v1/chat/completions";

    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey",
      },
      body: jsonEncode({
        "model": "gpt-4o-mini",
        "messages": [
          {"role": "user", "content": message}
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["choices"][0]["message"]["content"];
    } else {
      return "Error: ${response.body}";
    }
  }
}