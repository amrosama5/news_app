import 'package:flutter/material.dart';
import 'package:news_app_api/screens/widgets/news_item.dart';
import 'package:provider/provider.dart';

import '../models/news_model.dart';
import '../provider/my_provider.dart';
import '../shared/network/remote/api_manager.dart';

class SearchScreen extends SearchDelegate {

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: const Icon(Icons.search))
      ,const SizedBox(
        width: 15,
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNewsByQ(
        query,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text("error"));
        }
        List<Articles>? listArticles = snapshot.data?.articles ?? [];
        var provider = Provider.of<MyProvider>(context);
        return Container(
          decoration: BoxDecoration(
            color: provider.theme == ThemeMode.light ? Colors.white : const Color(0xff1C1B20),
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/pattern.png',
              ),
            ),
          ),
            child: NewsItem(listArticles: listArticles),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return  Container(
      color: provider.theme == ThemeMode.light ? Colors.white : const Color(0xff1C1B20),
      child: Center(
        child: Text("please enter word to search",style: TextStyle(fontSize: 20,color: provider.theme == ThemeMode.light ? Colors.black : Colors.white),),
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
      scaffoldBackgroundColor:provider.theme == ThemeMode.light ? Colors.white : const Color(0xff1C1B20),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Colors.green,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
