import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIService {
  static const String apiKey =
  String.fromEnvironment("OPENAI_API_KEY");

  Future<String> sendMessage(String message) async {
    try {
      final response = await http
          .post(
        Uri.parse("https://api.openai.com/v1/chat/completions"),
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
      )
          .timeout(const Duration(seconds: 15)); // timeout added

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["choices"][0]["message"]["content"];
      }

      switch (response.statusCode) {
        case 400:
          return "Bad request (check your input)";
        case 401:
          return "Invalid API key";
        case 402:
          return "Payment required";
        case 403:
          return "Access denied";
        case 404:
          return "API endpoint not found";
        case 429:
          return "Too many requests";
        case 500:
          return "Server error (try later)";
        case 503:
          return "Service unavailable";
        default:
          return "Unexpected error: ${response.statusCode}";
      }
    }

    on http.ClientException {
      return "Network error (check internet)";
    }

    on Exception catch (e) {
      if (e.toString().contains("TimeoutException")) {
        return "Request timeout (slow internet)";
      }
      return "Error: $e";
    }
  }
}