import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/news_model.dart';
import '../../provider/my_provider.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({required this.listArticles,super.key});
  final List<Articles>?  listArticles;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 12,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: provider.theme == ThemeMode.light ?Colors.white : const Color(0xff1C1B20),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: CachedNetworkImage(
                            imageUrl: listArticles?[index].urlToImage??"http://via.placeholder.com/350x150",
                            height: 200,
                            fit: BoxFit.fill,
                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          listArticles?[index].author ?? "",
                          style:  TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14,
                            color: provider.theme == ThemeMode.light ? Colors.black :Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          listArticles?[index].description ?? "",
                          style:  TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16,
                          color: provider.theme == ThemeMode.light ? Colors.black :Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: listArticles?.length,
        ));
  }
}
