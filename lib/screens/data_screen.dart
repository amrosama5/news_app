import 'package:flutter/material.dart';
import 'package:news_app_api/screens/widgets/news_item.dart';
import 'package:news_app_api/shared/network/remote/api_manager.dart';
import 'package:news_app_api/models/source_top_headlines_model.dart';
import 'package:provider/provider.dart';

import '../models/news_model.dart';
import '../provider/my_provider.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({required this.sourceList, super.key});
  final List<Sources> sourceList;
  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  int indexHeadLine = 0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Column(
      children: [
        DefaultTabController(
          length: widget.sourceList.length,
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              isScrollable: true,
              dividerColor: Colors.transparent,
              indicatorColor: provider.theme == ThemeMode.light ? Colors.transparent :Colors.black12,
              onTap: (val) {
                setState(() {
                  indexHeadLine = val;
                });
              },
              tabs: [
                for (int i = 0; i < widget.sourceList.length; i++) ...[
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.green,
                        ),
                        color: indexHeadLine == i
                            ? Colors.green
                            : Colors.transparent,
                      ),
                      child: Text(
                        style: TextStyle(
                          color:
                              indexHeadLine == i ? Colors.white : Colors.green,
                        ),
                        widget.sourceList[i].name ?? "",
                      ),
                    ),
                  )
                ],
              ],
            ),
          ),
        ),
        widget.sourceList.isEmpty
            ? const Center(
                child: Text(
                  "No News",
                ),
              )
            : FutureBuilder(
                future: ApiManager.getNewsBySources(
                  widget.sourceList[indexHeadLine].id ?? "",
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return const Text("error");
                  }
                  List<Articles>? listArticles = snapshot.data?.articles ?? [];
                  return NewsItem(listArticles: listArticles);
                },
              ),
      ],
    );
  }
}
