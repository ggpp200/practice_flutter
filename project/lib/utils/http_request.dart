import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> getTestApi() {
  return http.get(Uri.parse('http://127.0.0.1:8000/api/product/'));
}

class Info {
  final int id;
  final String word;
  final String createdAt;

  const Info({
    required this.id,
    required this.word,
    required this.createdAt,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'word': String word,
        'created_at': String createdAt,
      } =>
        Info(
          id: id,
          word: word,
          createdAt: createdAt,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

Future<List<Info>> fetchInfo() async {
  final response =
      await http.get(Uri.parse('http://127.0.0.1:8000/api/product/'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> body = json.decode(response.body);
    List<Info> allInfo =
        body.map((dynamic item) => Info.fromJson(item)).toList();
    return allInfo;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
