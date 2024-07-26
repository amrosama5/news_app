import 'package:flutter/material.dart';
import 'package:news_app_api/screens/source_item.dart';

import '../models/source_reposne.dart';
import '../shared/network/remote/api_manager.dart';
import 'news_item.dart';

class NewsTab extends StatefulWidget {
  List<Sources> sources;

  NewsTab({super.key, required this.sources});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              dividerColor: Colors.transparent,
              isScrollable: true,
              onTap: (value) {
                setState(() {});
                selectedIndex = value;
              },
              indicatorColor: Colors.transparent,
              tabs: widget.sources
                  .map((e) => Tab(
                        child: SourceItem(
                          source: e,
                          isSelected:
                              widget.sources.elementAt(selectedIndex) == e,
                        ),
                      ))
                  .toList(),
            )),
        FutureBuilder(
          future:
              ApiManager.getNewsData(widget.sources[selectedIndex].id ?? ""),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.green,
              ));
            }
            if (snapshot.hasError) {
              return Center(child: Text("Something went wrong"));
            }

            var articlesList = snapshot.data?.articles ?? [];
            if (articlesList.isEmpty) {
              return Center(child: Text("No SOurces"));
            }
            return Expanded(
              child: ListView.separated(

                separatorBuilder: (context, index) => SizedBox(
                  height: 12,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NewsItem(article: articlesList[index]),
                  );
                },
                itemCount: articlesList.length,
              ),
            );
          },
        )
      ],
    );
  }
}
