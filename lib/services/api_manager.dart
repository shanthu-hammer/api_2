import 'dart:convert';
import 'package:api_2/models/newsInfo.dart';
import 'package:http/http.dart' as http;

class API_Manager {
  Future<Newsmodel> getNews() async {
    var news;
    var client = http.Client();
    try {
      var response = await client.get(
          'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=c9e8334a7c6f47768658fe8cbdf59083');
      if (response.statusCode == 200) {
        var jasonString = response.body;
        // print("ClassName: successfully initialized: $jasonString");
        var jsonMap = json.decode(jasonString);
        news = Newsmodel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return news;
    }
    if (news == null) {
      print("its null bro ");
    } else {
      print("some other issue");
    }
    return news;
  }
}
