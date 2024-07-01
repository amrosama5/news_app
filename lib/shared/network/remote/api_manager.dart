import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../models/news_model.dart';
import '../../../models/source_top_headlines_model.dart';
class ApiManager{

   static Future<SourceModel?> getSourcesTopHeadLines({String? category})async{
 //https://newsapi.org/v2/top-headlines/sources?apiKey=c28d341053524926a18a4ac0b17f6942
    Uri url = Uri.https("newsapi.org","/v2/top-headlines/sources",{
    "apiKey":"c28d341053524926a18a4ac0b17f6942",
      "category":category
    });
    http.Response response=await http.get(url);
    var json= jsonDecode(response.body);

    return SourceModel.fromJson(json);
  }


  static Future<NewsModel> getNewsBySources(String search)async{
     //https://newsapi.org
    // /v2/everything
    // ?apiKey=c28d341053524926a18a4ac0b17f6942
    // &sources=FOCUS
    Uri url = Uri.https("newsapi.org","/v2/everything",{
      "apiKey":"c28d341053524926a18a4ac0b17f6942",
      "sources":search
    });
    http.Response response=await http.get(url);
    var json= jsonDecode(response.body);


    return NewsModel.fromJson(json);
  }

   static Future<NewsModel> getNewsByQ(String q)async{
     //https://newsapi.org
     // /v2/everything
     // ?apiKey=c28d341053524926a18a4ac0b17f6942
     // &sources=FOCUS
     Uri url = Uri.https("newsapi.org","/v2/everything",{
       "apiKey":"c28d341053524926a18a4ac0b17f6942",
       "q":q
     });
     http.Response response=await http.get(url);
     var json= jsonDecode(response.body);


     return NewsModel.fromJson(json);
   }

}