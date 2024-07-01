import 'package:flutter/material.dart';
import 'package:news_app_api/models/category_model.dart';
import 'package:provider/provider.dart';

import '../provider/my_provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({required this.onTap, super.key});
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var category = CategoryModel.getCategories();
    return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text(
              "Pick your category of interest",
              style: TextStyle(fontSize: 30,color: provider.theme == ThemeMode.light ? Colors.black : Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      onTap(
                        category[index],
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: category[index].color,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(28),
                          topRight: const Radius.circular(28),
                          bottomLeft: index.isOdd
                              ? const Radius.circular(28)
                              : Radius.zero,
                          bottomRight: index.isEven
                              ? const Radius.circular(28)
                              : Radius.zero,
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(category[index].image),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 18),
                            child: Text(
                              category[index].name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: category.length,
              ),
            )
          ],
        ),
      );
  }
}
