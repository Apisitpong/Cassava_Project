import 'package:http/http.dart' as http;
import '../่jsonfile/news_cassava.dart';

class NewsService {
  Future<List<NewsCassava>?> getNews() async {
    var client = http.Client();

    var uri = Uri.parse('https://retoolapi.dev/XR4bFA/news_cassava');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return newsCassavaFromJson(json);
    }
    return null;
  }
}

