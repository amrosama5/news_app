import 'package:flutter/material.dart';

import '../shared/network/remote/api_manager.dart';
import 'data_screen.dart';

class DataTab extends StatelessWidget {
  const DataTab({required this.categorySearch, super.key});
  final String categorySearch;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSourcesTopHeadLines(category: categorySearch),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(child: Text("error"));
          }
          var sourceList = snapshot.data?.sources ?? [];
          return DataScreen(
            sourceList: sourceList,
          );
        });
  }
}
