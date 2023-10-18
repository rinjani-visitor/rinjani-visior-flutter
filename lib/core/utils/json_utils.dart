import 'dart:convert';

class JsonParser {
  static Map<String, dynamic> stringToJson(String source) => jsonDecode(source);
  static String jsonToString(Map<String, dynamic> json) => jsonEncode(json);
}
