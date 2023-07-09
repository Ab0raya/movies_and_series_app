import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  final Map<String, String> headers = {
    'accept': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMDZmZmM2ZjE3YThkOWMzNzIwZGQ2YTBlMjYyMmUyZiIsInN1YiI6IjY0YTE3NmFhZDUxOTFmMDBjNTA2ZGNjYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ov5pB_KOYodRZJh2gajGOoTBpknW0PSiaWFVQgHOqoc'
  };

  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('There is issue in status code ${response.statusCode}');
    }
  }
}
