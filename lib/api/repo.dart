import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newss_app/model/fetchData.dart';

class Repo {
  Future<FetchData> fetchDataApi() async {
    String url =
        'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=231b9d66b0cd43c0b289393c1c51d24b';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return FetchData.fromJson(body);
    }
    throw Exception('Error');
  }
}
