import 'package:flutter/material.dart';
import '../shared/network/remote/api_manager.dart';
import 'news_tab.dart';

class DataTab extends StatelessWidget {
  String categoryId;

  DataTab({required this.categoryId, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Something went wrong"));
        }

        var sourcesList = snapshot.data?.sources ?? [];
        if (sourcesList.isEmpty) {
          return Center(child: Text("No SOurces"));
        }
        return NewsTab(
          sources: sourcesList,
        );
      },
    );
  }
}
