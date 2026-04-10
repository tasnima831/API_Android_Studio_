import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenRouterService {
  static const String apiKey =
  String.fromEnvironment("OPENROUTER_API_KEY");

  Future<String> sendMessage(String message) async {
    try {
      final res = await http.post(
        Uri.parse("https://openrouter.ai/api/v1/chat/completions"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiKey",
          "HTTP-Referer": "http://localhost",
          "X-Title": "My Flutter App",
        },
        body: jsonEncode({
          "model": "nvidia/nemotron-3-super-120b-a12b",
          "messages": [
            {"role": "user", "content": message}
          ]
        }),
      );

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        return data["choices"][0]["message"]["content"];
      } else if (res.statusCode == 429) {
        return "Rate limit reached (free tier)";
      } else if (res.statusCode == 401) {
        return "Invalid API key";
      } else {
        return "OpenRouter Error: ${res.statusCode}";
      }
    } catch (e) {
      return "Network Error: $e";
    }
  }
}