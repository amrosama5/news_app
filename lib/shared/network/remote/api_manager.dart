import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../models/NewsResponse.dart';
import '../../../models/source_reposne.dart';
import '../../components/constants.dart';

class ApiManager {
// https://newsapi.org/v2/top-headlines/sources?apiKey=
  static Future<SourceResponse> getSources(String category) async {
    Uri url = Uri.https(Constants.BASE_URL, "/v2/top-headlines/sources",
        {"apiKey": "dc3d106e730c4256b8c275d9da58d090","category": category});
    http.Response resposne = await http.get(url);
    Map<String, dynamic> json = jsonDecode(resposne.body);

    return SourceResponse.fromJson(json);
  }

  static Future<NewsResponse> getNewsData(String sourceId) async {
    Uri url =
        Uri.https(Constants.BASE_URL, "/v2/everything", {"sources": sourceId});
    var resposne = await http
        .get(url, headers: {"x-api-key": "dc3d106e730c4256b8c275d9da58d090"});

    var json = jsonDecode(resposne.body);
    return NewsResponse.fromJson(json);
  }
}
